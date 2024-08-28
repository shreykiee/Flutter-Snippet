void removeExpense(Expense expense) {
  final expenseIndex = _registeredExpenses.indexOf(expense);

  setState(() {
    _registeredExpenses.remove(expense);
    //show snackbar & implement UNDO
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(
            () {
              _registeredExpenses.insert(expenseIndex, expense);
            },
          ),
        ),
      ),
    );
  });
}
