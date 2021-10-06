import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> weeklyTransaction;

  Chart(this.weeklyTransaction);

  // getter
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // generates new list, takes element 7(here) times, index =0, 1,2, 3, .....
      final weekdays = DateTime.now().subtract(
        Duration(
          days: index,
        ),
        // substracts date from current time, so its like going back days untill 7 days
      );
      double totalSum = 0.0;

      for (var i = 0; i < weeklyTransaction.length; i++) {
        if (weeklyTransaction[i].date.day == weekdays.day &&
            weeklyTransaction[i].date.month == weekdays.month &&
            weeklyTransaction[i].date.year == weekdays.year) {
          totalSum += weeklyTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekdays).substring(0, 2),
        'amount': totalSum,
      };
    }).reversed.toList();
    // using reversed cause without it the last day comes first so to change that we reverse it, and it returns iterable so
    // converting that into a list with tolist()
  }

  double get totalSpendings {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      // starts from 0.0
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            // chart wouldnt move if the amount is not fitting in the chartbar, it would break line and fit however.
            // FlexFit.tight means take as much space as available accoring to its parent widget
            child: ChartBar(
              (data['day'] as String),
              (data['amount'] as double),
              totalSpendings == 0.0
                  ? 0.0
                  : ((data['amount'] as double) / totalSpendings),
            ),
          );
        }).toList(),
      ),
    );
  }
}
