import 'package:flutter/material.dart';

class NoTransactionsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: Text(
              'No Transactions Available!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.all(15),
          ),
          Container(
            height: 220,
            child: Card(
              child: Image.asset(
                'assets/images/no-transactions.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
