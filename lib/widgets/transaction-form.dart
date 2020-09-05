import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function _handleSubmit;

  TransactionForm(this._handleSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  DateTime selectedDate;

  void processSubmit() {
    final String title = this.titleInput.text;
    final double amount = double.parse(
        this.amountInput.text.isEmpty ? '0' : this.amountInput.text);
    if (title.isEmpty || amount <= 0 || selectedDate == null) return;
    widget._handleSubmit(title: title, amount: amount, date: selectedDate);
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
        selectedDate = chosenDate;
        processSubmit();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: TextField(
                      decoration: InputDecoration(labelText: 'Date'),
                      readOnly: true,
                      controller: TextEditingController(
                          text: selectedDate == null
                              ? 'Please select a date'
                              : DateFormat.yMMMMEEEEd().format(selectedDate)),
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
