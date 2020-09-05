import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/user-transaction.dart';
import './widgets/transaction-form.dart';
import './widgets/no-transactions.dart';
import './widgets/chart.dart';

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
  void handleSubmit({String title, double amount, DateTime date}) {
    final tx = Transaction(
        id: ValueKey(DateTime.now().toString()),
        amount: amount,
        date: date,
        title: title);
    setState(() => _userTransactions.add(tx));
  }

  void handleDelete(Key id) {
    setState(() => this._userTransactions.removeWhere((t) => t.id == id));
  }

  void handleEdit({String title, double amount, DateTime date, Key id}) {
    final Transaction tx = this._userTransactions.firstWhere((tx) => tx.id == id);
    setState(() {
      tx.title = title;
      tx.amount = amount;
      tx.date = date;
    });
  }

  void triggerAddTransactionModal(BuildContext ctx) {
    this.showModal(ctx, false, null);
  }

  void triggerEditTransactionModal(BuildContext ctx, Transaction tx) {
    this.showModal(ctx, true, tx);
  }

  void showModal(BuildContext ctx, bool isEditing, Transaction tx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: TransactionForm(this.handleSubmit, isEditing, this.handleEdit, tx),
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
            Chart(this._userTransactions),
            Container(
                height: 300,
                child: this._userTransactions.isEmpty
                    ? NoTransactionsMessage()
                    : ListView.builder(
                        itemBuilder: (ctx, i) => UserTransaction(
                            _userTransactions[i], this.handleDelete, () => this.triggerEditTransactionModal(ctx, _userTransactions[i])),
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
