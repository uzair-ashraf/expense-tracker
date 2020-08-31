import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final Transaction tx;
  UserTransaction(this.tx);
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Container(
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(color: Colors.deepPurple[900], fontSize: 20,),
                ),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.purple[400],
                        style: BorderStyle.solid,
                        width: 4.0)),
              ),
            ),
            Column(
              children: [Text(tx.title), Text(tx.date.toString())],
            )
          ],
        ),
      ),
    );
  }
}
