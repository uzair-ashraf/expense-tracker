import 'package:flutter/material.dart';

class ChartBlock extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return FractionallySizedBox(
      widthFactor: .14,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
      ),
    );
  }
}
