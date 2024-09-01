import 'package:flutter/material.dart';
import 'package:ladder/api/models/expenses.dart';
import 'package:ladder/api/models/transactions.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';

abstract class ExpensesDatasource {
  Future<List<dynamic>> fetchExpenses();
  Future<void> addExpenses(ExpenseModel model);
}

class ExpensesDatasourceImpl implements ExpensesDatasource {
  final HiveStore _hiveStore;
  final box = HiveBoxNames.expenses.name;
  final transactionBox = HiveBoxNames.transactions.name;

  ExpensesDatasourceImpl(this._hiveStore);

  @override
  Future<void> addExpenses(ExpenseModel model) async {
    debugPrint(".........key is here ... ${model.name.replaceAll(" ", "")}");
    try {
      await _hiveStore.saveItem(model, box, key: model.name.replaceAll(" ", ""));
      await _hiveStore.saveItem(
        TransactionModel.build(
          uid: model.uid,
          name: model.name,
          amount: model.amount,
          category: model.category,
        ),
        transactionBox,
        key: model.name.replaceAll(" ", ""),
      );
    } catch (e) {
      throw HiveFailure(e.toString());
    }
  }

  @override
  Future<List<dynamic>> fetchExpenses() async {
    try {
      final expenses = await _hiveStore.readAll(box);
      return expenses;
    } catch (e) {
      throw HiveFailure(e.toString());
    }
  }
}
