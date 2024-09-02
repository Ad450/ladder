import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/api/usecases/fetch.expenses.dart';
import 'package:ladder/api/usecases/fetch.revenues.dart';
import 'package:ladder/api/utils/helpers.dart';
import 'package:ladder/features/expenses/state/expenses.event.dart';
import 'package:ladder/features/expenses/state/expenses.state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final FetchExpenses fetchExpenses;
  final FetchRevenues fetchRevenues;

  ExpensesBloc({
    required this.fetchExpenses,
    required this.fetchRevenues,
  }) : super(const ExpensesState.initial()) {
    on<FetchExpensesEvent>(_fetchExpenses);
    // on<FetchHouseholdExpensesEvent>(_fetchHouseholdExpenses);
    // on<FetchTransportExpensesEvent>(_fetchTransportExpenses);
  }

  void _fetchExpenses(FetchExpensesEvent event, Emitter<ExpensesState> emit) async {
    emit(const ExpensesState.fetchExpensesLoading());

    final result = await fetchExpenses(const NoParam());

    result.fold(
      (l) => emit(ExpensesState.error(l.message)),
      (r) {
        print(".......... we are getting this as first ${r.first}");
        emit(ExpensesState.fetchExpensesSuccess(r));
      },
    );
  }

  // void _fetchTransportExpenses(FetchTransportExpensesEvent event, Emitter<ExpensesState> emit) async {
  //   emit(const ExpensesState.fetchTransportExpensesLoading());

  //   final result = await fetchExpenses(const NoParam());

  //   result.fold(
  //     (l) => emit(ExpensesState.error(l.message)),
  //     (r) => emit(
  //       ExpensesState.fetchTransportExpensesSuccess(r.where((e) => e.category == "Transport").toList()),
  //     ),
  //   );
  // }

  // void _fetchHouseholdExpenses(FetchHouseholdExpensesEvent event, Emitter<ExpensesState> emit) async {
  //   emit(const ExpensesState.fetchHouseholdExpensesLoading());

  //   final result = await fetchExpenses(const NoParam());

  //   result.fold(
  //     (l) => emit(ExpensesState.error(l.message)),
  //     (r) => emit(
  //       ExpensesState.fetchHouseholdExpensesSuccess(
  //         r.where((e) => e.category == "Household").toList(),
  //       ),
  //     ),
  //   );
  // }
}
