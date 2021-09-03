import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxHandller;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTxHandller);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: titleController,
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: amountController),
            
              
              FlatButton(
                textColor: Colors.purple,
                onPressed: () {
                  addTxHandller(
                      titleController.text, double.parse(amountController.value.text));
                },
                child: Text('Add Amount'),
              ),
            
          ],
        ),
      ),
    );
  }
}
