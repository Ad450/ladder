import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ladder/api/models/expense.model.dart';

part 'expenses.state.freezed.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = _ExpensesStateInitial;

  const factory ExpensesState.fetchExpensesSuccess(List<ExpenseModel> expenses) = _ExpensesStateFetchExpensesSuccess;

  const factory ExpensesState.fetchExpensesLoading() = _ExpensesStateFetchExpensesLoading;

  const factory ExpensesState.error(String message) = _ExpensesStateError;

  const factory ExpensesState.fetchFoodExpensesSuccess(List<dynamic> expenses) = _ExpensesStateFetchFoodExpensesSuccess;

  const factory ExpensesState.fetchFoodExpensesLoading() = _ExpensesStateFetchFoodExpensesLoading;

  const factory ExpensesState.fetchTransportExpensesSuccess(List<dynamic> expenses) =
      _ExpensesStateFetchTransportExpensesSuccess;

  const factory ExpensesState.fetchTransportExpensesLoading() = _ExpensesStateFetchTransportExpensesLoading;

  const factory ExpensesState.deleteExpenseLoading() = _ExpensesStateDeleteExpenseLoading;
  const factory ExpensesState.deleteExpenseSuccess() = _ExpensesStateDeleteExpenseSuccess;
}
