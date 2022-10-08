import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transactions.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans', 
            fontWeight: FontWeight.bold, 
            fontSize: 18)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6:TextStyle(
              fontFamily: 'OpenSans', 
              fontSize: 20,
              ),
               )
               ,)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 469.99, date: DateTime.now()),
    // Transaction(id: 't1', title: 'Wine', amount: 149.99, date: DateTime.now()),
    // Transaction(
    //     id: 't1',
    //     title: 'Weekly Groceries',
    //     amount: 160.87,
    //     date: DateTime.now()),
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

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: (){} ,
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
        title: Text('Personal Expenses',),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
