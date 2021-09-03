import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transaction = [
    Transaction(id: 't1', title: 'book', amount: 25.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'food', amount: 75.99, date: DateTime.now()),
  ];
  // String titleInput = '';
  // String amountInput = '';
  //*****   use TextEditingController its make more safety  variable as String variables *****/

  final titleConroller = TextEditingController();
  final amountConroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Expenses')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: amountConroller
// * comment line 50 till 52 because I use TextEditingController() class for Title

                    // onChanged: (value) {
                    //   titleInput = value;
                    // },

                    ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: titleConroller,

// * comment line 61 till 63 because I use TextEditingController() class for Amount

                  // onChanged: (value) {
                  //   amountInput = value;
                  // },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  child: FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      print(amountConroller.text);
                      print(titleConroller.text);
                    },
                    child: Text('Add Amount'),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return (Card(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),

                      //if  use ${} then our variable will be toString automatically by Dart and for this $ we have to  put  our code between '' or ""
                      // second $ means i just use it as dollar sign icon 
                      child: Text('${tx.amount} \$',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text(tx.title.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),

                        //use Intl package here to use as DateFormat its change date format to String automatically

                        Container(
                            child: Text(DateFormat.yMMMMEEEEd().format(tx.date),
                                style: TextStyle(color: Colors.grey)))
                      ],
                    )
                  ],
                ),
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
