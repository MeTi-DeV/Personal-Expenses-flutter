import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
//*****     here we should define list as dynamic     *****
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
    });
  }

  double get totalSpending {
    //comment 1 : flod() change our list value to number and sum them together first argument:(0.0): is satrter value to sum with our list object
    //section argument is an anonymous function that has 2 parameters (first is sum that is intiger value , second is item that has our list atributes and has all objects)
    //then calculate values what we want and return them as intiger value
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
      child:  Container(
        padding: EdgeInsets.all(15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: GroupTransactionsValues.map((data) {
                //comment 2 :pass all values to chart_bar
                //last parameter ratio our all amounts with totalSpending
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'], data['amount'],
                  totalSpending == 0.0 ? 0.0 : (data['amount'] as double )/ totalSpending),
            );
          }).toList()),
      ),
      ),
    );
  }
}
