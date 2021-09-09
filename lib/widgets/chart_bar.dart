import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctofAmount;
  ChartBar(this.label, this.spendingAmount, this.spendingPctofAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text('${spendingAmount.toStringAsFixed(0)} \$'))),
        SizedBox(height: 4),
        Container(
          height: 80,
          width: 10,
         
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
       
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
