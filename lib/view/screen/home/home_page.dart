import 'package:expense_tacker_app/model/expense.dart';
import 'package:expense_tacker_app/view/screen/expenses/new_expenses.dart';
import 'package:expense_tacker_app/view/widgets/chart/chart.dart';
import 'package:expense_tacker_app/view/widgets/expenses_list/expenses_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _registeredExpense = [
  
  ];

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 2,
        ),
        content: const Text('Expense deleted successfully.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpense.add(newExpense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      constraints: const BoxConstraints.expand(),
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addNewExpense),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget originalContent = const Center(
      child: Text('There is no Expenses. Let\'s add some.'),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay,
                icon: const Icon(
                  Icons.add,
                )),
          ],
          leading: IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.exit_to_app_rounded)),
        ),
        body: width < 600
            ? _registeredExpense.isEmpty
                ? originalContent
                : Column(
                    children: [
                      Chart(expenses: _registeredExpense),
                      Expanded(
                        child: ExpensesList(
                          expensesList: _registeredExpense,
                          onRemoveExpense: _removeExpense,
                        ),
                      ),
                    ],
                  )
            : _registeredExpense.isEmpty
                ? originalContent
                : Row(
                    children: [
                      Expanded(
                        child: Chart(expenses: _registeredExpense),
                      ),
                      Expanded(
                        child: ExpensesList(
                          expensesList: _registeredExpense,
                          onRemoveExpense: _removeExpense,
                        ),
                      ),
                    ],
                  ));
  }
}
