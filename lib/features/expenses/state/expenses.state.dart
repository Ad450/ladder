import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses.state.freezed.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = _ExpensesStateInitial;

  const factory ExpensesState.fetchFoodExpensesSuccess(List<dynamic> expenses) = _ExpensesStateFetchFoodExpensesSuccess;

  const factory ExpensesState.fetchFoodExpensesLoading() = _ExpensesStateFetchFoodExpensesLoading;

  const factory ExpensesState.fetchTransportExpensesSuccess(List<dynamic> expenses) =
      _ExpensesStateFetchTransportExpensesSuccess;

  const factory ExpensesState.fetchTransportExpensesLoading() = _ExpensesStateFetchTransportExpensesLoading;

  const factory ExpensesState.fetchHouseholdExpensesSuccess(List<dynamic> expenses) =
      _ExpensesStateFetchHouseholdExpensesSuccess;

  const factory ExpensesState.fetchHouseholdExpensesLoading() = _ExpensesStateFetchHouseholdExpensesLoading;

  const factory ExpensesState.error(String message) = _ExpensesStateError;
}
