import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/char_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  bool _areDatesEqual(DateTime dateTime1, DateTime dateTime2) =>
      dateTime1.day == dateTime2.day &&
      dateTime1.month == dateTime2.month &&
      dateTime1.year == dateTime2.year;

  double _getDateTotalAmount(DateTime weekDay) =>
      recentTransactions.fold(0.0, (value, transaction) {
        if (_areDatesEqual(transaction.date, weekDay))
          return value + transaction.amount;
        return value + 0;
      });

  List<Map<String, Object>> get groupedTransactionValues =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = _getDateTotalAmount(weekDay);

        return {
          "day": DateFormat.E().format(weekDay).substring(0, 1),
          "amount": totalSum
        };
      }).reversed.toList();

  double get totalSpending =>
      groupedTransactionValues.fold(0, (sum, item) => sum + item["amount"]);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map((data) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        label: data["day"],
                        spendingAmount: data["amount"],
                        spendingTotalPercentage: totalSpending == 0.0
                            ? 0.0
                            : (data["amount"] as double) / totalSpending),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
