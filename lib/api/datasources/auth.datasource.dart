import 'package:bcrypt/bcrypt.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ladder/api/models/profile.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthDatasource {
  Future<void> signup({required String name, required String email, required String password});
  Future<void> signin({required String email, required String password});
  Future<void> signout();
  Future<void> updateUser({
    required String name,
    String? profileFilePath,
  });

  Future<ProfileModel> fetchProfile();
}

class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl(this._supabase, this.hiveStore);

  final SupabaseClient _supabase;
  final HiveStore hiveStore;

  @override
  Future<void> signup({required String name, required String email, required String password}) async {
    try {
      final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

      // Insert user into the Account table
      final response = await _supabase.from('Account').insert({
        'name': name,
        'email': email,
        'password': hashedPassword,
      }).select();

      if (response.isEmpty) {
        throw ApiFailure("signup failed ");
      }
      final currentUser = response.first;
      await hiveStore.saveItem(currentUser["id"].toString(), "uid", key: "uid");
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> signin({required String email, required String password}) async {
    try {
      final response = await _supabase.from('Account').select().eq('email', email).single();

      if (response.isEmpty) {
        throw ApiFailure("User not found.");
      }

      final user = response;
      final storedPassword = user['password'] as String;

      // Verify the password
      if (!BCrypt.checkpw(password, storedPassword)) {
        throw ApiFailure("Invalid password.");
      }
      await hiveStore.saveItem(user["id"].toString(), "uid", key: "uid");
    } catch (e) {
      throw ApiFailure("Sign-in process failed: ${e.toString()}");
    }
  }

  @override
  Future<void> signout() async {
    try {
      await Hive.deleteBoxFromDisk(HiveBoxNames.transactions.name);
      await Hive.deleteBoxFromDisk(HiveBoxNames.expenses.name);
      await Hive.deleteBoxFromDisk(HiveBoxNames.revenues.name);

      await hiveStore.deleteItem("uid", "uid");
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
      final id = await hiveStore.readItem("uid", "uid");
      await _supabase.from('Account').update({
        'name': name,
        "profile_pic": profileFilePath,
      }).eq('id', int.parse(id.toString()));
    } catch (e) {
      throw ApiFailure("sign out failed");
    }
  }

  @override
  Future<ProfileModel> fetchProfile() async {
    try {
      final id = await hiveStore.readItem("uid", "uid");
      final user = await _supabase.from('Account').select().eq('id', int.parse(id.toString())).single();

      if (user.isNotEmpty) {
        return ProfileModel(name: user["name"], profileFilePath: user["profile_pic"]);
      }
      return ProfileModel(name: "username");
    } catch (e) {
      throw ApiFailure("could not fetch user profile");
    }
  }
}
