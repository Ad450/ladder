import 'package:freezed_annotation/freezed_annotation.dart';
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

  const factory DashboardState.fetchExpensesSuccess(List<dynamic> expenses) = _DashboardStateFetchExpensesSuccess;
  const factory DashboardState.fetchRevenueSuccess(List<dynamic> revenues) = _DashboardStateFetchRevenueSuccess;

  const factory DashboardState.fetchTransactionLoading() = _DashboardStateFetchTransactionLoading;
  const factory DashboardState.fetchTransactionSuccess(List<dynamic> metrics) = _DashboardStateFetchTransactionSuccess;

  const factory DashboardState.error(String message) = _DashboardStateError;
}
