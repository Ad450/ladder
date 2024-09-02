abstract class ExpensesEvent {}

class FetchFoodExpensesEvent extends ExpensesEvent {}

// class FetchHouseholdExpensesEvent extends ExpensesEvent {}

class FetchTransportExpensesEvent extends ExpensesEvent {}

class FetchExpensesEvent extends ExpensesEvent {}

class DeleteExpenseEvent extends ExpensesEvent {
  String id;
  DeleteExpenseEvent(this.id);
}
