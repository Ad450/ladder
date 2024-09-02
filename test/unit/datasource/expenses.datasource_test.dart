import 'package:flutter_test/flutter_test.dart';
import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/models/expense.model.dart';
import 'package:ladder/api/network/parse.networ.response.dart';
import 'package:ladder/api/utils/api.errors.dart';
import 'package:mockito/mockito.dart';

import 'auth.datasource_test.mocks.dart';

void main() {
  late ExpensesDatasourceImpl expensesDatasourceImpl;
  late MockNetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    expensesDatasourceImpl = ExpensesDatasourceImpl(mockNetworkService);
  });

  group("add expense", () {
    test("should add expense when network post is successful", () async {
      // Arrange
      when(mockNetworkService.post("/user/expenditure", data: anyNamed("data"))).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {"message": "success"},
        ),
      );

      // Act
      await expensesDatasourceImpl.addExpenses(
        ExpenseModel(
          nameOfItem: "nameOfItem",
          category: "category",
          estimatedAmount: 3,
        ),
      );

      // Assert

      verify(mockNetworkService.post("/user/expenditure", data: anyNamed("data")));
    });

    test("should throw an ApiFailure when add expense fails on network post failure", () async {
      // Arrange
      when(mockNetworkService.post("/user/expenditure", data: anyNamed("data"))).thenThrow(
        (_) async => ParsedNetworkResponse(
          data: null,
        ),
      );

      // Act
      try {
        await expensesDatasourceImpl.addExpenses(
          ExpenseModel(
            nameOfItem: "nameOfItem",
            category: "category",
            estimatedAmount: 3,
          ),
        );
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert

      verify(mockNetworkService.post("/user/expenditure", data: anyNamed("data")));
    });
  });

  group("Fetch Expenses ", () {
    test("should fetch all expenses when network get is successful", () async {
      // Arrange
      when(mockNetworkService.getHttp("/user/expenditure", data: anyNamed("data"))).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {
            "data": [
              {"id": "id", "nameOfItem": "name here", "estimatedAmount": "2", "category": "food"}
            ]
          },
        ),
      );

      // act
      final result = await expensesDatasourceImpl.fetchExpenses();

      // assert
      expect(result, isA<List<ExpenseModel>>());
      expect(result, hasLength(1));
      verify(mockNetworkService.getHttp("/user/expenditure")).called(1);
    });

    test("should throw an ApiFailure when fetch all expenses fails on network get failure", () async {
      // Arrange
      when(mockNetworkService.getHttp("/user/expenditure", data: anyNamed("data"))).thenThrow(
        (_) async => ParsedNetworkResponse(data: null),
      );

      // Act and Assert
      try {
        await expensesDatasourceImpl.fetchExpenses();
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert
      verify(mockNetworkService.getHttp("/user/expenditure")).called(1);
    });
  });

  group("Delete Expenses ", () {
    test("should delete expenses with a given Id when network get is successful", () async {
      // Arrange
      when(mockNetworkService.delete("/user/expenditure/id")).thenAnswer(
        (_) async => ParsedNetworkResponse(
          data: {"message": "success"},
        ),
      );

      // act
      await expensesDatasourceImpl.deleteExpense("id");

      // assert

      verify(mockNetworkService.delete("/user/expenditure/id")).called(1);
    });

    test("should throw an ApiFailure when delete expense with id fails on network get", () async {
      // Arrange
      when(mockNetworkService.delete("/user/expenditure/id")).thenThrow(
        (_) async => ParsedNetworkResponse(data: null),
      );

      // Act and Assert
      try {
        await expensesDatasourceImpl.deleteExpense("id");
      } catch (e) {
        expect(e, isA<ApiFailure>());
      }

      // Assert
      verify(mockNetworkService.delete("/user/expenditure/id")).called(1);
    });
  });
}
