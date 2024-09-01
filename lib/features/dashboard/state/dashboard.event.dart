abstract class DashboardEvent {}

class AddRevenueEvent extends DashboardEvent {
  AddRevenueEvent();
}

class AddExpensesEvent extends DashboardEvent {
  final String category;

  AddExpensesEvent({required this.category});
}

class FetchRevenuesEvent extends DashboardEvent {}

class FetchExpensesEvent extends DashboardEvent {}

class FetchTransactionsEvent extends DashboardEvent {}
