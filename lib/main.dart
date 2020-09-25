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
    final Transaction tx =
        this._userTransactions.firstWhere((tx) => tx.id == id);
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
            child: TransactionForm(
                this.handleSubmit, isEditing, this.handleEdit, tx),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext ctx) {
    final appBar = AppBar(
      title: Text('Expense Tracker'),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => this.triggerAddTransactionModal(ctx))
      ],
    );
    final adjustedHeight = MediaQuery.of(ctx).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(ctx).padding.top;
    final isLandscape = MediaQuery.of(ctx).orientation == Orientation.landscape;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: adjustedHeight * (isLandscape ? 0.45 : 0.3),
                child: Chart(this._userTransactions)),
            Container(
                height: adjustedHeight * (isLandscape ? 0.55 : 0.7),
                child: this._userTransactions.isEmpty
                    ? LayoutBuilder(builder: (ctx, constraints) {
                        return NoTransactionsMessage(constraints, isLandscape);
                      })
                    : ListView.builder(
                        itemBuilder: (ctx, i) => UserTransaction(
                            _userTransactions[i],
                            this.handleDelete,
                            () => this.triggerEditTransactionModal(
                                ctx, _userTransactions[i])),
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
