import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final Transaction tx;
  UserTransaction(this.tx);
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(child: Text('\$${tx.amount.toStringAsFixed(2)}')),
          radius: 35.0,
        ),
        title: Text(
          tx.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          DateFormat.yMMMMEEEEd().format(tx.date),
          style: TextStyle(color: Colors.blueGrey[400]),
        ),
      ),
    );
  }
}
