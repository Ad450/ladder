import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ladder/api/models/expense.model.dart';

part 'expenses.state.freezed.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = _ExpensesStateInitial;

  const factory ExpensesState.fetchExpensesSuccess(List<ExpenseModel> expenses) = _ExpensesStateFetchExpensesSuccess;

  const factory ExpensesState.fetchExpensesLoading() = _ExpensesStateFetchExpensesLoading;

  const factory ExpensesState.error(String message) = _ExpensesStateError;
}
