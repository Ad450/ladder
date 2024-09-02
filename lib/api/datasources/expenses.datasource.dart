import 'package:ladder/api/models/expense.model.dart';
import 'package:ladder/api/network/network.service.dart';

import 'package:ladder/api/utils/api.errors.dart';

abstract class ExpensesDatasource {
  Future<List<ExpenseModel>> fetchExpenses();
  Future<void> addExpenses(ExpenseModel model);
  Future<void> deleteExpense(String id);
  Future<ExpenseModel> getExpensesById(String id);
}

class ExpensesDatasourceImpl implements ExpensesDatasource {
  final NetworkService networkService;

  ExpensesDatasourceImpl(this.networkService);

  @override
  Future<void> addExpenses(ExpenseModel model) async {
    final data = {
      "nameOfItem": model.nameOfItem,
      "estimatedAmount": model.estimatedAmount.toString(),
      "category": model.category,
    };
    try {
      final res = await networkService.post("/user/expenditure", data: data);
      if (res.data != null) {
        return;
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<List<ExpenseModel>> fetchExpenses() async {
    try {
      final res = await networkService.getHttp("/user/expenditure");
      if (res.data != null) {
        return (res.data!["data"] as List)
            // unnecessary filtering but doing that because I inserted an expense
            // with null estimated value, api didnt reject it

            .where((e) => e["estimatedAmount"] != null) // Filter out null estimatedAmount
            .map(
              (e) => ExpenseModel(
                nameOfItem: e["nameOfItem"],
                category: e["category"],
                estimatedAmount: int.tryParse(e["estimatedAmount"].toString())!,
                id: e["id"].toString(),
              ),
            )
            .toList();
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> deleteExpense(String id) async {
    try {
      final res = await networkService.delete("/user/expenditure/$id");
      if (res.data != null) {
        return;
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<ExpenseModel> getExpensesById(String id) async {
    try {
      final res = await networkService.delete("/user/expenditure/$id");
      if (res.data != null) {
        final data = res.data!;
        return ExpenseModel(
          nameOfItem: data["nameOfItem"],
          category: data["category"],
          estimatedAmount: int.tryParse(data["estimatedAmount"].toString())!,
        );
      }
      throw ApiFailure(res.code!.toString());
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }
}
