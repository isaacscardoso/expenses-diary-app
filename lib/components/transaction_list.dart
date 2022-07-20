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
    return SingleChildScrollView(
      child: SizedBox(
        height: screenSize - (screenSize * (49.0 / 100)),
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 20),
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
                    child: ListTile(
                      leading: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(Icons.payments_outlined),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'R\$ ${item.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        DateFormat('d MMM y - HH:mm').format(item.date),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        item.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
