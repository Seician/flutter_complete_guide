import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 469.99, date: DateTime.now()),
    Transaction(id: 't1', title: 'Wine', amount: 149.99, date: DateTime.now()),
    Transaction(
        id: 't1',
        title: 'Weekly Groceries',
        amount: 160.87,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions)
    ]);
  }
}
