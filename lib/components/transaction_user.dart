import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expenses_diary/models/transaction.dart';
import 'package:expenses_diary/components/transaction_form.dart';
import 'package:expenses_diary/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: '1',
        title: 'Cinema',
        value: 59.90,
        date: DateTime(2022, 1, 24, 20, 00)),
    Transaction(
      id: '2',
      title: 'Lanchonete',
      value: 35.79,
      date: DateTime(2022, 3, 09, 12, 30),
    ),
    Transaction(
        id: '3',
        title: 'Academia',
        value: 65.00,
        date: DateTime(2022, 1, 24, 20, 00)),
    Transaction(
      id: '4',
      title: 'Spotify',
      value: 9.90,
      date: DateTime(2022, 3, 09, 12, 30),
    ),
    Transaction(
        id: '5',
        title: 'Faculdade',
        value: 275.65,
        date: DateTime(2022, 1, 24, 20, 00)),
    Transaction(
      id: '6',
      title: 'Steam',
      value: 75.90,
      date: DateTime(2022, 3, 09, 12, 30),
    ),
  ];

  void _addTransaction(String title, double value) {
    final transaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(onSubmitForm: _addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
