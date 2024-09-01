import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ladder/api/models/profile.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';

abstract class AuthDatasource {
  Future<void> signup({required String name, required String email, required String password});
  Future<void> signin({required String email, required String password});
  Future<void> signout();
  Future<void> updateUser({required String name, String? profileFilePath});

  Future<ProfileModel> fetchProfile();
}

class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl(this.hiveStore, this.instance);

  final HiveStore hiveStore;
  final FirebaseAuth instance;

  @override
  Future<void> signup({required String name, required String email, required String password}) async {
    try {
      final credential = await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user?.uid == null) {
        throw ApiFailure("could not sign up");
      } else {
        await hiveStore.saveItem(credential.user?.uid, "uid", key: "uid");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ApiFailure('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ApiFailure('The account already exists for that email.');
      } else {
        throw ApiFailure(e.code);
      }
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> signin({required String email, required String password}) async {
    try {
      final credential = await instance.signInWithEmailAndPassword(email: email, password: password);

      await hiveStore.saveItem(credential.user?.uid, "uid", key: "uid");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ApiFailure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ApiFailure('Wrong password provided for that user.');
      } else {
        throw ApiFailure(e.code);
      }
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> signout() async {
    try {
      await Hive.deleteBoxFromDisk(HiveBoxNames.transactions.name);
      await Hive.deleteBoxFromDisk(HiveBoxNames.expenses.name);
      await Hive.deleteBoxFromDisk(HiveBoxNames.revenues.name);

      await hiveStore.deleteItem("uid", "uid");
      await instance.signOut();
    } catch (e) {
      throw ApiFailure("sign out failed");
    }
  }

  @override
  Future<void> updateUser({
    required String name,
    String? profileFilePath,
  }) async {
    try {
      final currentUser = instance.currentUser;
      await currentUser?.updateDisplayName(name);
      await currentUser?.updatePhotoURL(profileFilePath);
      // await currentUser.updatePassword(newPassword)
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    try {
      final currentUser = instance.currentUser;

      return ProfileModel(name: currentUser?.displayName ?? "username", profileFilePath: currentUser?.photoURL);
    } catch (e) {
      throw ApiFailure("could not fetch user profile");
    }
  }
}
