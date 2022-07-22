import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_diary/models/transaction.dart';
import 'package:expenses_diary/formatters/currency_brl_formatter.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const SizedBox(
                  height: 34,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
                        radius: 22,
                        child: Icon(
                          Icons.paid_outlined,
                          color: Colors.black,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            CurrencyBrlFormatter.format(value: item.value),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        DateFormat("d 'de' MMMM 'de' y", 'pt_BR')
                            .format(item.date),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
