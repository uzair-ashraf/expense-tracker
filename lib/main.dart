import 'package:flutter/material.dart';

import './widgets/transaction-manager.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.purple[800],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [TransactionManager()],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    ));
  }
}
