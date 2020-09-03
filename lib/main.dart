import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/user-transaction.dart';
import './widgets/transaction-form.dart';
import './widgets/no-transactions.dart';

void main() {
  return runApp(MaterialApp(
    home: App(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: 'New Shoes',
    //     amount: 69.99,
    //     date: DateTime.now()),
    // Transaction(
    //     id: DateTime.now().toString(),
    //     title: 'Skyrim VR',
    //     amount: 59.99,
    //     date: DateTime.now()),
  ];
  void handleSubmit({String title, double amount}) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now(),
        title: title);
    setState(() => _userTransactions.add(tx));
  }

  void triggerAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: TransactionForm(this.handleSubmit),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => this.triggerAddTransactionModal(ctx))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TransactionForm(this.handleSubmit),
            Container(
                height: 300,
                child: this._userTransactions.isEmpty
                    ? NoTransactionsMessage()
                    : ListView.builder(
                        itemBuilder: (ctx, i) =>
                            UserTransaction(_userTransactions[i]),
                        itemCount: _userTransactions.length,
                      ))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
