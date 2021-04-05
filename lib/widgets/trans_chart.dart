import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/bar.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var sumAmountOfTheDay = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          sumAmountOfTheDay += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(sumAmountOfTheDay.toString());
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sumAmountOfTheDay
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, gTx) {
      return sum + gTx['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactions);

    return Card(
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...groupedTransactions.map((e) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: Bar(
                      e['day'],
                      e['amount'],
                      totalSpending == 0.0
                          ? 0.0
                          : (e['amount'] as double) / totalSpending));
            }).toList(),
          ],
        ),
      ),
    );
  }
}
