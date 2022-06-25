import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.onSubmitForm})
      : super(key: key);

  final void Function(String, double) onSubmitForm;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  void _onSubmitForm() {
    String title = titleController.text;
    double value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isNotEmpty && value > 0) {
      widget.onSubmitForm(title, value);
    }
  }

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
                  onPressed: _onSubmitForm,
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
