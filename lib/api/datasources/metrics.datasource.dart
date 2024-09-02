import 'package:ladder/api/datasources/expenses.datasource.dart';
import 'package:ladder/api/datasources/revenue.datasource.dart';
import 'package:ladder/api/models/metrics.model.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';

abstract class MetricsDatasource {
  Future<MetricsModel> fetchMetrics();
  Future<List<dynamic>> fetchTransations();
}

class MetricsDatasourceImpl implements MetricsDatasource {
  MetricsDatasourceImpl(this._expensesDatasource, this._revenueDatasource, this._hiveStore);

  final ExpensesDatasource _expensesDatasource;
  final RevenueDatasource _revenueDatasource;
  final HiveStore _hiveStore;

  final transactionBox = HiveBoxNames.transactions.name;

  @override
  Future<MetricsModel> fetchMetrics() async {
    try {
      final expenses = await _expensesDatasource.fetchExpenses();
      final revenues = await _revenueDatasource.fetchRevenues();

      List<int> expensesAmounts = expenses.map((e) => e.estimatedAmount).toList();
      List<int> revenuesAmounts = revenues.map((e) => e.amount).toList();

      final totalExpenses = expensesAmounts.fold(0.0, (previousValue, e) => previousValue + e);
      final totalRevenues = revenuesAmounts.fold(0.0, (previousValue, e) => previousValue + e);

      return MetricsModel(
        totalExpenses: totalExpenses,
        totalRevenues: totalRevenues,
        totalTransactions: (totalExpenses + totalRevenues),
      );
    } catch (e) {
      throw HiveFailure(e.toString());
    }
  }

  @override
  Future<List<dynamic>> fetchTransations() async {
    try {
      final txs = await _hiveStore.readAll(transactionBox);

      return txs;
    } catch (e) {
      throw HiveFailure(e.toString());
    }
  }
}
