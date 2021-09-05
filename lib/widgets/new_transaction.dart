    import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxHandller;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTxHandller);
  @override
  Widget build(BuildContext context) {
    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      } 
        addTxHandller(enteredTitle, enteredAmount);
      
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
