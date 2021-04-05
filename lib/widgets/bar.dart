import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String weekday;
  final double dayAmount;
  final double percentageOfTotal;
  Bar(this.weekday, this.dayAmount, this.percentageOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 20,child: FittedBox(child: Text('\$${dayAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 20,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: percentageOfTotal,
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4,),
        Text(weekday)
      ],
    );
  }
}
