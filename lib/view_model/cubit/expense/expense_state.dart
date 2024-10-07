import 'package:expense_tacker_app/model/expense.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;

  ExpenseLoaded(this.expenses);
}

class ExpenseError extends ExpenseState {
  final String message;

  ExpenseError(this.message);
}
