import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

// ignore: must_be_immutable
class TransactionForm extends StatefulWidget {
  final Function _handleSubmit;
  final Function _handleEdit;
  final bool isEditing;
  Transaction editingTransaction;
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  DateTime selectedDate;

  TransactionForm(this._handleSubmit, this.isEditing, this._handleEdit, this.editingTransaction) {
    if(isEditing) {
      final Transaction tx = editingTransaction;
      titleInput.text = tx.title;
      amountInput.text = tx.amount.toStringAsFixed(2);
      selectedDate = tx.date;
    }
  }

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {

  void processSubmit() {
    final String title = widget.titleInput.text;
    final double amount = double.parse(
        widget.amountInput.text.isEmpty ? '0' : widget.amountInput.text);
    if (title.isEmpty || amount <= 0 || widget.selectedDate == null) return;
    widget._handleSubmit(title: title, amount: amount, date: widget.selectedDate);
    Navigator.of(context).pop();
  }
  void processEdit() {
    final String title = widget.titleInput.text;
    final double amount = double.parse(
    widget.amountInput.text.isEmpty ? '0' : widget.amountInput.text);
    if (title.isEmpty || amount <= 0 || widget.selectedDate == null) return;
    widget._handleEdit(title: title, amount: amount, date: widget.selectedDate, id: widget.editingTransaction.id);
    Navigator.of(context).pop();
  }

  void generateDateModal() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((chosenDate) {
      if (chosenDate == null) return;
      setState(() {
        widget.selectedDate = chosenDate;
        if(widget.isEditing) {
          processEdit();
        } else {
          processSubmit();
        }
      });
    });
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
              controller: widget.titleInput,
              decoration: InputDecoration(labelText: 'Expense'),
              onSubmitted: (_) => widget.isEditing ? processEdit : processSubmit,
            ),
            TextField(
              controller: widget.amountInput,
              decoration: InputDecoration(labelText: 'Cost'),
              onSubmitted: (_) => widget.isEditing ? processEdit : processSubmit,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: TextField(
                      decoration: InputDecoration(labelText: 'Date'),
                      readOnly: true,
                      controller: TextEditingController(
                          text: widget.selectedDate == null
                              ? 'Please select a date'
                              : DateFormat.yMMMMEEEEd().format(widget.selectedDate)),
                      onTap: this.generateDateModal),
                ),
                Flexible(
                  child: IconButton(
                    color: Colors.deepPurple,
                    icon: Icon(Icons.date_range_rounded),
                    onPressed: this.generateDateModal,
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 14, 5, 4),
                child: RaisedButton(
                  child: Text(
                    '${widget.isEditing ? 'Edit Transaction' : 'Add Transaction'}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.deepPurple[900],
                  onPressed: widget.isEditing ? processEdit : processSubmit,
                ))
          ],
        ),
      ),
    );
  }
}
