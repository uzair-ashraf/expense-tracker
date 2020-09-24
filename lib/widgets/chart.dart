import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart-block.dart';

class Chart extends StatelessWidget {
  List<Transaction> transactions;
  Map<String, double> organziedTransactions;
  double totalSpent = 0.00;
  Chart(List<Transaction> transactions) {
    this.transactions = transactions;
    this.organziedTransactions = {
      'Mon': 0.00,
      'Tue': 0.00,
      'Wed': 0.00,
      'Thu': 0.00,
      'Fri': 0.00,
      'Sat': 0.00,
      'Sun': 0.00
    };
    for (int i = 0; i < transactions.length; i++) {
      DateTime dayOfTransaction = transactions[i].date;
      String dayKey =
          DateFormat.EEEE().format(dayOfTransaction).toString().substring(0, 3);
      double amount = transactions[i].amount;
      totalSpent += amount;
      this.organziedTransactions[dayKey] += amount;
    }
  }
  List<Widget> generateChartBlocks() {
    List<Widget> chartBlocks = [];
    this.organziedTransactions.forEach((key, value) {
      chartBlocks.add(LayoutBuilder(
        builder: (ctx, constraints) {
          return ChartBlock(
            day: key,
            amountSpent: value,
            totalSpent: this.totalSpent,
            constraints: constraints,
          );
        },
      ));
    });
    return chartBlocks;
  }

  @override
  Widget build(BuildContext ctx) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: this.generateChartBlocks(),
      ),
    );
  }
}
