import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, dynamic>> get GroupTransactionsValues {
    return List.generate(7, (index) {
      final Weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == Weekday.day &&
            recentTransactions[i].date.month == Weekday.month &&
            recentTransactions[i].date.year == Weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(Weekday));
      print(totalSum);
      return {
        'day': DateFormat.E().format(Weekday).substring(0, 2),
        'amount': totalSum
      };
      //comment 1 : change list to reverse to begin our list from right to left
      // it was as default left to right
    }).reversed.toList();
  }

  double get totalSpending {
    return GroupTransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(GroupTransactionsValues);
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: GroupTransactionsValues.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      totalSpending == 0.0
                          ? 0.0
                          : (data['amount'] as double) / totalSpending),
                );
              }).toList()),
        ),
      ),
    );
  }
}
