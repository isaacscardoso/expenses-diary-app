import 'dart:math';
import 'package:flutter/material.dart';
import 'package:expenses_diary/models/transaction.dart';
import 'package:expenses_diary/components/transaction_form.dart';
import 'package:expenses_diary/components/transaction_list.dart';
import 'package:expenses_diary/components/chart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'Expenses Diary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'NotoSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((rt) {
      return rt.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double value, DateTime date) {
    final transaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
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
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text(
          'Despesas Di??rias',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(
              Icons.add_circle_outline,
              size: 34,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransactions: _recentTransactions),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
    );
  }
}
