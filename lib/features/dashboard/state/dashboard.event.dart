abstract class DashboardEvent {}

class AddRevenueEvent extends DashboardEvent {
  AddRevenueEvent();
}

class AddExpensesEvent extends DashboardEvent {}

class FetchRevenuesEvent extends DashboardEvent {}

// class FetchExpensesEvent extends DashboardEvent {}

class FetchTransactionsEvent extends DashboardEvent {}

class DeleteRevenueEvent extends DashboardEvent {
  String id;
  DeleteRevenueEvent(this.id);
}
