import 'package:expenses_diary/components/chart_bar.dart';
import 'package:expenses_diary/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_diary/extensions/string_capitalize.dart';

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
        'day': DateFormat.E('pt_BR').format(weekDay).capitalize(),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((gt) {
            return Expanded(
              child: ChartBar(
                label: gt['day'],
                value: gt['value'],
                percentage: gt['value'] / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
