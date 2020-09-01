import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function _handleSubmit;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  TransactionForm(this._handleSubmit);
  void processSubmit() {
    final String title = this.titleInput.text;
    final double amount = double.parse(this.amountInput.text.isEmpty ? '0' : this.amountInput.text);
    if(title.isEmpty || amount <= 0) return;
    _handleSubmit(title: title, amount: amount);
  }

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
              onSubmitted: (_) => processSubmit(),
            ),
            TextField(
              controller: amountInput,
              decoration: InputDecoration(labelText: 'Cost'),
              onSubmitted: (_) => processSubmit(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 8, 5, 4),
                child: RaisedButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.deepPurple[900],
                  onPressed: processSubmit,
                ))
          ],
        ),
      ),
    );
  }
}
