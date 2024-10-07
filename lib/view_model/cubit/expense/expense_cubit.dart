import 'package:bloc/bloc.dart';
import 'package:expense_tacker_app/model/expense.dart';
import 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial());

  void loadExpenses() {
    emit(ExpenseLoaded([])); // بدءًا من قائمة فارغة
  }

  void addExpense(Expense expense) {
    if (state is ExpenseLoaded) {
      final currentState = state as ExpenseLoaded;
      emit(ExpenseLoaded([...currentState.expenses, expense]));
    }
  }

  void removeExpense(Expense expense) {
    if (state is ExpenseLoaded) {
      final currentState = state as ExpenseLoaded;
      final updatedExpenses = List<Expense>.from(currentState.expenses);
      updatedExpenses.remove(expense);
      emit(ExpenseLoaded(updatedExpenses));
    }
  }

  void undoRemoveExpense(Expense expense, int index) {
    if (state is ExpenseLoaded) {
      final currentState = state as ExpenseLoaded;
      final updatedExpenses = List<Expense>.from(currentState.expenses);
      updatedExpenses.insert(index, expense);
      emit(ExpenseLoaded(updatedExpenses));
    }
  }
}
