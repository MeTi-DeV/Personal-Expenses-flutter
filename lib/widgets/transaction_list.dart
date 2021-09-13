import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'Not Any Transaction Add Yet',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: TransactionItem(transactions: transactions[index], deleteTx: deleteTx),
                );
              },
            ),
    );
  }
}
