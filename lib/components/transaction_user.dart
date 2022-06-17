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
      date: DateTime(2022, 05, 15, 18, 45),
    ),
    Transaction(
      id: '4',
      title: 'Crunchyroll',
      value: 29.90,
      date: DateTime(2022, 09, 01, 7, 00),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions: _transactions),
        const TransactionForm(),
      ],
    );
  }
}
