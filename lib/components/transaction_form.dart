import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key, required this.onSubmitForm}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmitForm;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () => onSubmitForm(
                    titleController.text,
                    double.tryParse(valueController.text) ?? 0.0,
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
