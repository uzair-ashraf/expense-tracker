import 'package:flutter/material.dart';

class NoTransactionsMessage extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isLandscape;
  NoTransactionsMessage(this.constraints, this.isLandscape);
  @override
  Widget build(BuildContext ctx) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(isLandscape ? 2 : 12),
      child: Card(
        child: Column(
          children: [
            Container(
              child: Text(
                'No Transactions Available!',
                style: TextStyle(
                    fontSize: isLandscape ? 15 : 20,
                    fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.all(isLandscape ? 5 : 15),
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: constraints.maxHeight * .4,
              child: Image.asset(
                'assets/images/no-transactions.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
