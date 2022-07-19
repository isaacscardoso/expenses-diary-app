import 'package:expenses_diary/components/chart_bar.dart';
import 'package:expenses_diary/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (Transaction rt in recentTransactions) {
        bool sameDay = rt.date.day == weekDay.day;
        bool sameMonth = rt.date.month == weekDay.month;
        bool sameYear = rt.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += rt.value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: groupedTransactions.map((gt) {
          return ChartBar(
            label: gt['day'],
            value: gt['value'],
            percentage: 0.4,
          );
        }).toList(),
      ),
    );
  }
}
