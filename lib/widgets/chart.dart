import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

// comment 1 : first  crate  my chart widget
class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

// comment 2 : line 14 its most imporance part of this widget
// comment 3 : get is a dynamic calculator, here is for  calculate my recet 7 days , its type is  List<Map<String,Object>> because it will be list of objects inside it
//first we create our list of days and amount above it each day by Lis.generate()

  List<Map<String, Object>> get GroupTransactionsValues {
    //comment 4 : Lis.generate() get 2 arguments first is length of our list second its works like a container
    return List.generate(7, (index) {

      // comment 5 : first define a variable like Weekday its get time from itself time to duration of the index
      final Weekday = DateTime.now().subtract(Duration(days: index));
      //comment 6 : second define a variable by name totalSum to calculate all of our amount per day 
      double totalSum = 0.0;
      // comment 7 : useing for loop to calculate eacth day amounts
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == Weekday.day &&
            recentTransactions[i].date.month == Weekday.month &&
            recentTransactions[i].date.year == Weekday.year) {
          totalSum += recentTransactions[i].amount;

        }
      }
      print(DateFormat.E().format(Weekday));
      print(totalSum);
      // comment 8: at last return our type of map lis
      return {'day': DateFormat.E().format(Weekday), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(GroupTransactionsValues);
    return Container(
        child: Card(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [],
            )));
  }
}
