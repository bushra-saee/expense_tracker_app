import 'package:expense_tacker_app/model/expense.dart';
import 'package:expense_tacker_app/view/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: ((context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.7),
              margin: Theme.of(context).cardTheme.margin,
            ),
            key: ValueKey(expensesList[index]),
            child: ExpensesItem(
              expensesList[index],
            ),
            onDismissed: (direction) {
              onRemoveExpense(expensesList[index]);
            },
          )),
    );
  }
}
