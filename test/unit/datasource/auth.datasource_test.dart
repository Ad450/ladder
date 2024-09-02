import 'package:flutter_test/flutter_test.dart';
import 'package:ladder/api/datasources/auth.datasource.dart';
import 'package:ladder/api/models/user.model.dart';
import 'package:ladder/api/network/network.service.dart';
import 'package:ladder/api/network/parse.networ.response.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth.datasource_test.mocks.dart';

@GenerateMocks([NetworkService, HiveStore])
void main() {
  late AuthDatasourceImpl authDatasourceImpl;
  late MockNetworkService mockNetworkService;
  late MockHiveStore mockHiveStore;

  // initializations
  setUp(() {
    mockHiveStore = MockHiveStore();
    mockNetworkService = MockNetworkService();
    authDatasourceImpl = AuthDatasourceImpl(mockNetworkService, mockHiveStore);
  });

  group("signup", () {
    // should signup successfully
    test("should signup successfully when network post and hive save is successful", () async {
      // Arrange

      final userModel = UserModel(name: "test user", email: "email@gmail.com", password: "12343434");
      when(mockNetworkService.post("/auth/signup", data: userModel.toJson())).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {"message": "sucess"},
        ),
      );
      when(mockHiveStore.saveItem("name", "name", key: "name")).thenAnswer((realInvocation) async => true);

      // Act
      await authDatasourceImpl.signup(
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
      );
      // Assert
      verify(mockNetworkService.post('/auth/signup', data: userModel.toJson())).called(1);

      verify(mockHiveStore.saveItem(userModel.name, "name", key: "name")).called(1);
    });

    // should throw an ApiFailure when signup fails

    test("should throw an ApiFailure when network post fails", () async {
      // Arrange

      final userModel = UserModel(name: "test user", email: "email@gmail.com", password: "12343434");
      when(mockNetworkService.post("/auth/signup", data: userModel.toJson())).thenThrow(
        (_) async => ParsedNetworkResponse(
          data: null,
        ),
      );

      // Act and Assert
      try {
        await authDatasourceImpl.signup(
          name: userModel.name,
          email: userModel.email,
          password: userModel.password,
        );
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert
      verify(mockNetworkService.post('/auth/signup', data: userModel.toJson())).called(1);

      verifyNever(mockHiveStore.saveItem(userModel.name, "name", key: "name"));
    });
  });

  // login

  group("login", () {
    // should login successfully
    test("should login successfully when network post and hive save is successful", () async {
      // Arrange

      final data = {"email": "email@gmail.com", "password": "12343434"};

      when(mockNetworkService.post("/auth/login", data: data)).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {"message": "sucess"},
        ),
      );
      when(mockHiveStore.saveItem(any, any, key: anyNamed("key"))).thenAnswer((realInvocation) async => true);

      // Act
      await authDatasourceImpl.signin(
        email: data["email"]!,
        password: data["password"]!,
      );
      // Assert
      verify(mockNetworkService.post('/auth/login', data: data));

      verify(mockHiveStore.saveItem(any, any, key: anyNamed("key")));
    });

    // should throw an ApiFailure when login fails
    test("should throw an ApiFailure when network post fails", () async {
      // Arrange
      final data = {"email": "email@gmail.com", "password": "12343434"};

      when(mockNetworkService.post("/auth/login", data: data)).thenThrow(
        (_) async => ParsedNetworkResponse(
          data: null,
        ),
      );

      // Act and Assert
      try {
        await authDatasourceImpl.signin(
          email: data["email"]!,
          password: data["password"]!,
        );
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert
      verify(mockNetworkService.post('/auth/login', data: data));

      verifyNever(mockHiveStore.saveItem(any, any, key: anyNamed("key")));
    });
  });
}
