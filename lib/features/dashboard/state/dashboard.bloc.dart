import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/api/usecases/add.expenses.dart';
import 'package:ladder/api/usecases/add.revenue.dart';
import 'package:ladder/api/usecases/fetch.expenses.dart';
import 'package:ladder/api/usecases/fetch.revenues.dart';
import 'package:ladder/api/usecases/fetch.transactions.dart';
import 'package:ladder/api/utils/helpers.dart';
import 'package:ladder/features/dashboard/state/dashboard.event.dart';
import 'package:ladder/features/dashboard/state/dashboard.state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AddExpenses addExpenses;
  final AddRevenue addRevenue;
  final FetchExpenses fetchExpenses;
  final FetchRevenues fetchRevenues;

  final FetchTransactions fetchTransactions;

  final TextEditingController expensesAmountController = TextEditingController();
  final TextEditingController expensesNameController = TextEditingController();
  final TextEditingController expenseCategoryController = TextEditingController();

  final TextEditingController revenueAmountController = TextEditingController();
  final TextEditingController revenueNameController = TextEditingController();

  DashboardBloc({
    required this.addExpenses,
    required this.addRevenue,
    required this.fetchExpenses,
    required this.fetchRevenues,
    required this.fetchTransactions,
  }) : super(const DashboardState.initial()) {
    on<AddExpensesEvent>(_addExpenses);
    on<AddRevenueEvent>(_addRevenue);
    // on<FetchExpensesEvent>(_fetchExpenses);
    on<FetchRevenuesEvent>(_fetchRevenue);

    on<FetchTransactionsEvent>(_fetchTransactions);
  }

  void _addExpenses(AddExpensesEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.addExpensesLoading());

    final result = await addExpenses(AddExpensesParam(
      name: expensesNameController.value.text,
      amount: expensesAmountController.value.text,
      category: expenseCategoryController.value.text,
    ));

    result.fold(
      (l) => emit(DashboardState.error(l.message)),
      (r) => emit(const DashboardState.addExpensesSuccess()),
    );
  }

  void _addRevenue(AddRevenueEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.addRevenueLoading());

    final result = await addRevenue(AddRevenueParam(
      name: revenueNameController.value.text,
      amount: revenueAmountController.value.text,
    ));

    result.fold(
      (l) => emit(DashboardState.error(l.message)),
      (r) => emit(const DashboardState.addRevenueSuccess()),
    );
  }

  // void _fetchExpenses(FetchExpensesEvent event, Emitter<DashboardState> emit) async {
  //   emit(const DashboardState.fetchExpensesLoading());

  //   final result = await fetchExpenses(const NoParam());

  //   result.fold(
  //     (l) => emit(DashboardState.error(l.message)),
  //     (r) => emit(DashboardState.fetchExpensesSuccess(r)),
  //   );
  // }

  void _fetchRevenue(FetchRevenuesEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.fetchRevenueLoading());

    final result = await fetchRevenues(const NoParam());

    result.fold(
      (l) => emit(DashboardState.error(l.message)),
      (r) => emit(DashboardState.fetchRevenueSuccess(r)),
    );
  }

  void _fetchTransactions(FetchTransactionsEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.fetchTransactionLoading());

    final result = await fetchTransactions(const NoParam());

    result.fold(
      (l) => emit(DashboardState.error(l.message)),
      (r) => emit(DashboardState.fetchTransactionSuccess(r..sort((a, b) => b.date.compareTo(a.date)))),
    );
  }
}
