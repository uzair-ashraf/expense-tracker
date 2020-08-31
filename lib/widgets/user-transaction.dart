import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final Transaction tx;
  UserTransaction(this.tx);
  Widget build(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Card(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent[700],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.deepPurpleAccent[700],
                          style: BorderStyle.solid,
                          width: 4.0)),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      tx.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    margin: EdgeInsets.only(bottom: 6),
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(tx.date),
                    style: TextStyle(color: Colors.blueGrey[400]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
