import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final Transaction tx;
  final Function deleteTransaction;
  UserTransaction(this.tx, this.deleteTransaction);
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Dismissible(
        key: tx.id,
        onDismissed: (_) => this.deleteTransaction(tx.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.delete))
            ],
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Container(
                margin: EdgeInsets.all(10),
                child: FittedBox(
                    child: Text('\$${tx.amount.toStringAsFixed(2)}'))),
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
      ),
    );
  }
}
