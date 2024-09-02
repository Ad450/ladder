import 'package:ladder/api/models/profile.model.dart';
import 'package:ladder/api/models/user.model.dart';
import 'package:ladder/api/network/network.service.dart';
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
  AuthDatasourceImpl(this.networkService, this.hiveStore);

  final NetworkService networkService;
  final HiveStore hiveStore;

  @override
  Future<void> signup({required String name, required String email, required String password}) async {
    try {
      final user = UserModel(name: name, email: email, password: password);
      final res = await networkService.post("/auth/signup", data: user.toJson());
      if (res.data != null) {
        if (res.code == null) {
          await hiveStore.saveItem(name, "name", key: "name");
          return;
        } else {
          throw ApiFailure(res.code!.toString());
        }
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> signin({required String email, required String password}) async {
    try {
      final data = <String, String>{"email": email, "password": password};
      final res = await networkService.post("/auth/login", data: data);
      if (res.data != null) {
        // save accessToken for further request
        // email and password would be required to fetch new access token as there is no
        // endpoint to get a new access token

        await hiveStore.saveItem(res.data!["accessToken"], "accessToken", key: "accessToken");
        await hiveStore.saveItem(email, "email", key: "email");
        await hiveStore.saveItem(password, "password", key: "password");

        return;
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> signout() async {
    try {
      await hiveStore.deleteItem("accessToken", "accessToken");
    } catch (e) {
      throw ApiFailure("sign out failed");
    }
  }

  // simulating update since no update user endpoint available
  // this will be consumed in settings

  @override
  Future<void> updateUser({
    required String name,
    String? profileFilePath,
  }) async {
    try {
      await hiveStore.saveItem(profileFilePath, "profilePath", key: "profilePath");
      await hiveStore.saveItem(name, "name", key: "name");
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  /// function does not work because endpoints provides to user id
  // @override
  // Future<UserModel> fetchProfile() async {
  //   try {
  //     final id = await hiveStore.readItem("uid", "uid");
  //     final res = await networkService.getHttp("/auth/user/$id/profile");
  //     if (res.data != null) {
  //       await hiveStore.saveItem(res.data!["id"], "uid", key: "uid");
  //       return UserModel.fromJson(res.data!);
  //     }
  //     throw ApiFailure(res.code!.toString());
  //   } catch (e) {
  //     throw ApiFailure(e.toString());
  //   }
  // }

// simulating profile fetch
  @override
  Future<ProfileModel> fetchProfile() async {
    try {
      final profilePath = await hiveStore.readItem("profilePath", "profilePath");
      final name = await hiveStore.readItem("name", "name");

      return ProfileModel(name: name, profilePath: profilePath);
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }
}
