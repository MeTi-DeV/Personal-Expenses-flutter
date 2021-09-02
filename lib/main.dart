import 'package:flutter/material.dart';
import './transaction.dart';

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
    Transaction(
        id: 't1', title: 'book', amount: 25.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'food', amount: 75.99, date: DateTime.now()),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Expenses')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Container(child: Text(tx.amount.toString())),
                    Column(
                      children: [Text(tx.title), Text(tx.date.toString())],
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
