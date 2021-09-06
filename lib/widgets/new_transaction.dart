import 'package:flutter/material.dart';

// change to stateful because i want to restore values ​​entered
// its save values when we change our Entrance between Title and Amount here
class NewTransaction extends StatefulWidget {
  final Function addTxHandller;

  NewTransaction(this.addTxHandller);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }
      // .widget is a properti of flutter that it will be added when we want to use variables that defined as our widget argument we should use before use our variables
      widget.addTxHandller(enteredTitle, enteredAmount);

      //Navigator its an other flutter attributes its mean here to close all widget that open uper than home app, like when we click on check button after entered Amount value it will close all widgets uperside our app

      Navigator.of(context).pop();
    }

    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController),
            TextField(
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () => submitData(),
              child: Text('Add Amount'),
            ),
          ],
        ),
      ),
    );
  }
}
