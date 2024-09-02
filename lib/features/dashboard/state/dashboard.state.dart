import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ladder/api/models/expense.model.dart';
import 'package:ladder/api/models/revenue.model.dart';
part 'dashboard.state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _DashboardStateInitial;

  const factory DashboardState.addRevenueSuccess() = _DashboardStateAddRevenueSuccess;
  const factory DashboardState.addExpensesSuccess() = _DashboardStateAddExpenses;

  const factory DashboardState.addRevenueLoading() = _DashboardStateAddRevenueLoading;
  const factory DashboardState.addExpensesLoading() = _DashboardStateAddExpensesLoading;

  const factory DashboardState.fetchExpensesLoading() = _DashboardStateFetchExpensesLoading;
  const factory DashboardState.fetchRevenueLoading() = _DashboardStateFetchRevenueLoading;

  const factory DashboardState.fetchExpensesSuccess(List<ExpenseModel> expenses) = _DashboardStateFetchExpensesSuccess;
  const factory DashboardState.fetchRevenueSuccess(List<RevenueModel> revenues) = _DashboardStateFetchRevenueSuccess;

  const factory DashboardState.fetchTransactionLoading() = _DashboardStateFetchTransactionLoading;
  const factory DashboardState.fetchTransactionSuccess(List<dynamic> metrics) = _DashboardStateFetchTransactionSuccess;

  const factory DashboardState.deleteRevenueLoading() = _DashboardStateDeleteRevenueLoading;
  const factory DashboardState.deleteRevenueSuccess() = _DashboardStateDeleteRevenueSuccess;

  const factory DashboardState.error(String message) = _DashboardStateError;
}
