import 'package:flutter/material.dart';

class ChartBlock extends StatelessWidget {
  final String day;
  final double amountSpent;
  final double totalSpent;
  ChartBlock({this.day, this.amountSpent, this.totalSpent});
  @override
  Widget build(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Text('\$${amountSpent.toStringAsFixed(0)}'),
          Container(
            width: 20,
            height: 60,
            margin: EdgeInsets.all(4),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black, width: 1.0)),
                ),
                FractionallySizedBox(
                    heightFactor:
                        totalSpent == 0.0 ? 0.0 : amountSpent / totalSpent,
                    child: Container(color: Colors.deepPurple))
              ],
            ),
          ),
          Text(day)
        ],
      ),
    );
  }
}
