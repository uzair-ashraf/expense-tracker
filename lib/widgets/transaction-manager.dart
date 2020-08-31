import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './user-transaction.dart';
import './transaction-form.dart';

class TransactionManager extends StatefulWidget {
  @override
  _TransactionManagerState createState() => _TransactionManagerState();
}

class _TransactionManagerState extends State<TransactionManager> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: DateTime.now().toString(),
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now()
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Skyrim VR',
      amount: 59.99,
      date: DateTime.now()
    ),
  ];
  void handleSubmit({String title, double amount}) {
    final tx = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      date: DateTime.now(),
      title: title
    );
    setState(() => _userTransactions.add(tx));
  }
  @override
  Widget build(BuildContext ctx) {
    return Column(children: [
      TransactionForm(this.handleSubmit),
      ..._userTransactions.map((tx) => UserTransaction(tx)).toList()
    ],);
  }
}
