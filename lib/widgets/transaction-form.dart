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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titleInput,
          ),
          TextField(
            controller: amountInput,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          RaisedButton(
            child: Text('Add Transaction'),
            onPressed: () => _handleSubmit(title: this.titleInput.text, amount: double.parse(this.amountInput.text)),
          )
        ],
      ),
    );
  }
}
