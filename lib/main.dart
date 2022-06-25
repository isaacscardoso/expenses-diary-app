import 'dart:math';
import 'package:flutter/material.dart';
import 'package:expenses_diary/models/transaction.dart';
import 'package:expenses_diary/components/transaction_form.dart';
import 'package:expenses_diary/components/transaction_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Diary',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
      id: '1',
      title: 'Cinema',
      value: 59.90,
      date: DateTime(2022, 1, 24, 20, 00),
    ),
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
      date: DateTime(2022, 1, 24, 20, 00),
    ),
    Transaction(
      id: '4',
      title: 'Padaria',
      value: 29.90,
      date: DateTime(2022, 3, 09, 12, 30),
    ),
    Transaction(
      id: '5',
      title: 'Disney+',
      value: 45.90,
      date: DateTime(2022, 1, 24, 20, 00),
    ),
    Transaction(
      id: '6',
      title: 'Steam',
      value: 75.90,
      date: DateTime(2022, 3, 09, 12, 30),
    ),
    Transaction(
      id: '7',
      title: 'Steam',
      value: 75.90,
      date: DateTime(2022, 3, 09, 12, 30),
    ),
    Transaction(
      id: '8',
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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmitForm: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text('Despesas Diárias'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Card(
              child: Text('Gráfico', textAlign: TextAlign.center),
            ),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
