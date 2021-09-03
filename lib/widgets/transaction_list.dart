import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Transaction_List extends StatelessWidget {
  final List<Transaction> transactions;
  Transaction_List(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return (Card(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),

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
    );
  }
}
