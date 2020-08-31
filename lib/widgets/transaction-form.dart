import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function _handleSubmit;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  TransactionForm(this._handleSubmit);

  @override
  Widget build(BuildContext ctx) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleInput,
              decoration: InputDecoration(labelText: 'Expense'),
            ),
            TextField(
              controller: amountInput,
              decoration: InputDecoration(labelText: 'Cost'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 5, 4),
              child: RaisedButton(
                child: Text('Add Transaction', style: TextStyle(color: Colors.white, fontSize: 16),),
                color: Colors.deepPurple[900],
                onPressed: () => _handleSubmit(
                    title: this.titleInput.text,
                    amount: double.parse(this.amountInput.text)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
