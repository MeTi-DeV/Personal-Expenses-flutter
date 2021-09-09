import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Center(
              child: Column(
                children: [
                  Text(
                    'Not Any Transaction Add Yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: Container(
                      height: 100,
                      alignment: AlignmentDirectional.center,
                      // use ListTile instead of Row its make our widget shorter and make performance higher
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: FittedBox(
                                child: Text(
                                    '${transactions[index].amount.toStringAsFixed(2)} \$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    )),
                              ),
                            ),
                          ),
                          title: Text(transactions[index].title,
                              style: Theme.of(context).textTheme.title),
                          subtitle: Text(transactions[index].date.day==DateTime.now().day?
                              DateFormat('hh : mm : ss \nEEEE d MMMM y')
                                  .format(transactions[index].date):DateFormat('EEEE d MMMM y').format(transactions[index].date),
                              style: TextStyle(color: Colors.grey))),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

                // return (Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(15),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.purple, width: 2)),
                //         margin:
                //             EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                //         child: Text(
                //             '${transactions[index].amount.toStringAsFixed(2)} \$',
                //             style: TextStyle(
                //                 fontFamily: 'OpenSans',
                //                 color: Colors.purple,
                //                 fontSize: 20,
                //                 fontWeight: FontWeight.bold)),
                //       ),
                //       Column(
                //         children: [
                //           Container(
                //             padding: EdgeInsets.only(bottom: 12),
                //             child: Text(transactions[index].title,
                //                 style: Theme.of(context).textTheme.title),
                //           ),
                //           Container(
                //               child: Text(
                //                   DateFormat('hh : mm : ss \nEEEE d MMMM y')
                //                       .format(transactions[index].date),
                //                   style: TextStyle(color: Colors.grey)))
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                //);