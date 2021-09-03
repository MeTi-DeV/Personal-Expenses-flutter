import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:700,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tx) {
            return (Card(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      
      
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
      
      
                      Container(
                          child: Text(DateFormat('yyyy-MM-dd | hh : mm : ss').format(tx.date),
                              style: TextStyle(color: Colors.grey)))
                    ],
                  )
                ],
              ),
            ));
          }).toList(),
        ),
      ),
    );
  }
}
