import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      /**** 
      

      //ListView.Builder give  us high performance more than ListView for ulimits List when we use it we
      // dont need to use .map( ) for build our list . 
      //ListView.Builder has 2 important attributes 
      //1 . itemCount : we have to say to this class we want to render how many items
      //2 . itemBuilder: we have to define the anonymous function with 2 arguments(first: its type of BuilderContext, second: its type of int) line: 27
      //second argument give correct number of my transactions array to function
      //and first argument complate by Flutter and make our list


    ****/
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return (Card(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text('${transactions[index].amount} \$',
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(transactions[index].title.toUpperCase(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          child: Text(
                              DateFormat('yyyy-MM-dd | hh : mm : ss')
                                  .format(transactions[index].date),
                              style: TextStyle(color: Colors.grey)))
                    ],
                  )
                ],
              ),
            ));
          }),
    );
  }
}
