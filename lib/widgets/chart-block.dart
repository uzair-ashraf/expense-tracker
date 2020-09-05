import 'package:flutter/material.dart';

class ChartBlock extends StatelessWidget {
  final String day;
  final double amountSpent;
  final double totalSpent;
  ChartBlock({this.day, this.amountSpent, this.totalSpent});
  @override
  Widget build(BuildContext ctx) {
    return Container(
      width: 30,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
              height: 20,
              child: FittedBox(
                  child: Text('\$${amountSpent.toStringAsFixed(0)}'))),
          Container(
            width: 20,
            height: 60,
            margin: EdgeInsets.all(4),
            child: Stack(
              alignment: Alignment.bottomCenter,
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
