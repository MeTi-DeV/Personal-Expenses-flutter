import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxHandller;

  NewTransaction(this.addTxHandller);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime  _selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      final enteredTitle = _titleController.text;
      final enteredAmount = double.parse(_amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate==null) {
        return;
      }
      widget.addTxHandller(enteredTitle, enteredAmount, _selectedDate);

      Navigator.of(context).pop();
    }
    void _PresentTimePeaker() {
    
   
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now())
          .then((pickDate) {
        if (pickDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickDate;
        });
      });
    }

    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                onSubmitted: (_) => _submitData(),
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: _titleController),
            TextField(
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        color: Color.fromRGBO(255, 10, 84, 0.2),
                        child: Text(
                          _selectedDate == null
                              ? 'No Date Chosen !!'
                              : ('${'Date Choose : '}${DateFormat('y/M/d').format(_selectedDate)}'),
                          style: TextStyle(
                            color: Color.fromRGBO(255, 10, 84, 1),
                          ),
                        ),
                      ),
                      Container(
                        child: FlatButton(
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                            onPressed: () => _PresentTimePeaker()),
                      )
                    ]),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RaisedButton(
                  textColor: Theme.of(context).textTheme.button!.color,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _submitData(),
                  child: Text('Add Amount'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
