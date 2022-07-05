import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_diary/models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenSize - (screenSize * (27.8 / 100)),
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 20,
                  ),
                  child: Text(
                    'Nenhuma Transação cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: screenSize - (screenSize * (66.7 / 100)),
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final item = transactions[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${item.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormat('d MMM y - HH:mm').format(item.date),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              item.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
