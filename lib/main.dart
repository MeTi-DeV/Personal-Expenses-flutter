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

                      //if  use ${} then our variable will toString automatically by Dart
                      // second $ means i just use it as dollar sig icon and for first $ we have to  put  our code between ''
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
