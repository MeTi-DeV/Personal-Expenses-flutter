import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';
class User_Transaction extends StatefulWidget {
  @override
  _User_TransactionState createState() => _User_TransactionState();
}

class _User_TransactionState extends State<User_Transaction> {

 final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'book', amount: 25.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'food', amount: 75.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      New_Transaction(),
      Transaction_List(_userTransactions),
    ]);
  }
}
