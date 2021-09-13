import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
//comment 1 : split to new widget this widget is configuration for each transaction
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        alignment: AlignmentDirectional.center,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text(
                  '${transactions.amount.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          title: Text(transactions.title,
              style: Theme.of(context).textTheme.headline6),
          subtitle: Text(
              transactions.date.day == DateTime.now().day
                  ? DateFormat('hh : mm : ss \nEEEE d MMMM y')
                      .format(transactions.date)
                  : DateFormat('EEEE d MMMM y').format(transactions.date),
              style: TextStyle(color: Colors.grey)),
          trailing: MediaQuery.of(context).size.width > 450
              ? FlatButton.icon(
                  onPressed: () => deleteTx(transactions.id),
                  icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                  label: Text(
                    'Delet item',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ))
              : IconButton(
                  //comment 2 : use deleteTx as delete button function
                  onPressed: () => deleteTx(transactions.id),
                  icon:
                      Icon(Icons.delete, color: Theme.of(context).errorColor)),
        ),
      ),
    );
  }
}
