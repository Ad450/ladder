import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/api/usecases/delete.expense.dart';

import 'package:ladder/api/usecases/fetch.expenses.dart';
import 'package:ladder/api/usecases/fetch.revenues.dart';
import 'package:ladder/api/utils/helpers.dart';
import 'package:ladder/features/expenses/state/expenses.event.dart';
import 'package:ladder/features/expenses/state/expenses.state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final FetchExpenses fetchExpenses;
  final FetchRevenues fetchRevenues;
  final DeleteExpense deleteExpense;

  ExpensesBloc({
    required this.fetchExpenses,
    required this.fetchRevenues,
    required this.deleteExpense,
  }) : super(const ExpensesState.initial()) {
    on<FetchExpensesEvent>(_fetchExpenses);
    on<FetchFoodExpensesEvent>(_fetchFoodExpenses);
    on<FetchTransportExpensesEvent>(_fetchTransportExpenses);
    on<DeleteExpenseEvent>(_deleteExpense);
  }

  void _fetchExpenses(FetchExpensesEvent event, Emitter<ExpensesState> emit) async {
    emit(const ExpensesState.fetchExpensesLoading());

    final result = await fetchExpenses(const NoParam());

    result.fold(
      (l) => emit(ExpensesState.error(l.message)),
      (r) {
        final other = r
            .where(
              (e) => e.category.trim().toLowerCase() != "transport" && e.category.trim().toLowerCase() != "food",
            )
            .toList();
        emit(ExpensesState.fetchExpensesSuccess(other));
      },
    );
  }

  void _fetchTransportExpenses(FetchTransportExpensesEvent event, Emitter<ExpensesState> emit) async {
    emit(const ExpensesState.fetchTransportExpensesLoading());

    final result = await fetchExpenses(const NoParam());

    result.fold(
      (l) => emit(ExpensesState.error(l.message)),
      (r) => emit(
        ExpensesState.fetchTransportExpensesSuccess(
            r.where((e) => e.category.trim().toLowerCase() == "transport").toList()),
      ),
    );
  }

  void _fetchFoodExpenses(FetchFoodExpensesEvent event, Emitter<ExpensesState> emit) async {
    emit(const ExpensesState.fetchFoodExpensesLoading());

    final result = await fetchExpenses(const NoParam());

    result.fold(
      (l) => emit(ExpensesState.error(l.message)),
      (r) {
        final allFoodExpenses = r.where((e) => e.category.trim().toLowerCase() == "food").toList();
        emit(
          ExpensesState.fetchFoodExpensesSuccess(allFoodExpenses),
        );
      },
    );
  }

  void _deleteExpense(DeleteExpenseEvent event, Emitter<ExpensesState> emit) async {
    emit(const ExpensesState.deleteExpenseLoading());
    final result = await deleteExpense(event.id);

    result.fold(
      (l) => emit(ExpensesState.error(l.message)),
      (r) => emit(const ExpensesState.deleteExpenseSuccess()),
    );
  }
}
