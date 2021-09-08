import 'package:flutter/material.dart';

//comment 1 : create our ChartBar widget with 3 entrance
// spendingPctofAmount for colorize each day colums
class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctofAmount;
  ChartBar(this.label, this.spendingAmount, this.spendingPctofAmount);

  @override
  Widget build(BuildContext context) {
    //comment 2 : our charts are like a colum so create in a colum all parts
    return Column(
      children: [
        FittedBox(child: Text('${spendingAmount.toStringAsFixed(0)} \$')),
        SizedBox(height: 4),
        Container(
          height: 80,
          width: 10,
          //comment 3 : Stack is widget that make layouts are overhand together chart of each day has a color and background color of that chart
          //finally Stack() use for multiple layout like this bodies 
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              //comment 4 : FractionallySizedBox() is a widget for colorize a layout of Stack() with an atribute by name of heightFactor that resives number to colorize taht colun by vlaue of the number that it gets
               // 
              FractionallySizedBox(
                heightFactor: spendingPctofAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label)
      ],
    );
  }
}
