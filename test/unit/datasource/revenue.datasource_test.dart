import 'package:flutter_test/flutter_test.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/models/expense.model.dart';
import 'package:ladder/api/models/revenue.model.dart';
import 'package:ladder/api/network/parse.networ.response.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:mockito/mockito.dart';

import 'auth.datasource_test.mocks.dart';

void main() {
  late RevenueDatasourceImpl revenueDatasourceImpl;
  late MockNetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    revenueDatasourceImpl = RevenueDatasourceImpl(mockNetworkService);
  });

  group("add revenue", () {
    test("should add revenue when network post is successful", () async {
      // Arrange
      when(mockNetworkService.post("/user/income", data: anyNamed("data"))).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {"message": "success"},
        ),
      );

      // Act
      await revenueDatasourceImpl.addRevenue(
        RevenueModel(
          nameOfRevenue: "name",
          amount: 1,
        ),
      );

      // Assert

      verify(mockNetworkService.post("/user/income", data: anyNamed("data")));
    });

    test("should throw an ApiFailure when add revenue fails", () async {
      // Arrange
      when(mockNetworkService.post("/user/income", data: anyNamed("data"))).thenThrow(
        (_) async => ParsedNetworkResponse(
          data: null,
        ),
      );

      // Act
      try {
        await revenueDatasourceImpl.addRevenue(
          RevenueModel(
            nameOfRevenue: "name",
            amount: 1,
          ),
        );
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert

      verify(mockNetworkService.post("/user/income", data: anyNamed("data")));
    });
  });

  group("Fetch Revenues ", () {
    test("should fetch all revenues when network get is successful", () async {
      // Arrange
      when(mockNetworkService.getHttp("/user/income")).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {
            "data": [
              {"id": "id", "nameOfRevenue": "name here", "amount": 2}
            ]
          },
        ),
      );

      // act
      final result = await revenueDatasourceImpl.fetchRevenues();

      // assert
      expect(result, isA<List<RevenueModel>>());
      expect(result, hasLength(1));
      verify(mockNetworkService.getHttp("/user/income")).called(1);
    });

    test("should throw an ApiFailure when fetch revenues fails on network failure", () async {
      // Arrange
      when(mockNetworkService.getHttp("/user/income")).thenThrow(
        (_) async => ParsedNetworkResponse(data: null),
      );

      // Act and Assert
      try {
        await revenueDatasourceImpl.fetchRevenues();
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert
      verify(mockNetworkService.getHttp("/user/income")).called(1);
    });
  });

  group("Delete Revenue ", () {
    test("should delete revenue with a given Id when network get is successful", () async {
      // Arrange
      when(mockNetworkService.delete("/user/income/id")).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {"message": "success"},
        ),
      );

      // act
      await revenueDatasourceImpl.deleteRevenue("id");

      // assert

      verify(mockNetworkService.delete("/user/income/id")).called(1);
    });

    test("should throw an ApiFailure when delete revenue with id fails on network get failure", () async {
      // Arrange
      when(mockNetworkService.delete("/user/income/id")).thenThrow(
        (_) async => ParsedNetworkResponse(data: null),
      );

      // Act and Assert
      try {
        await revenueDatasourceImpl.deleteRevenue("id");
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert
      verify(mockNetworkService.delete("/user/income/id")).called(1);
    });
  });
}
