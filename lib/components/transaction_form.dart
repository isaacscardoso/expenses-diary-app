import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expenses_diary/formatters/currency_brl_mask.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.onSubmitForm})
      : super(key: key);

  final void Function(String, double) onSubmitForm;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  DateTime? _selectedDate;

  void _onSubmitForm() {
    String title = _titleController.text;
    String reformatValue = _valueController.text
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');

    double value = double.tryParse(reformatValue) ?? 0.0;

    if (title.isNotEmpty && value > 0) {
      widget.onSubmitForm(title, value);
    }
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 10),
    ).then((date) {
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyBrlMask(),
              ],
              decoration: const InputDecoration(
                labelText: 'Valor',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _selectedDate == null
                      ? 'Nenhuma data selecionada.'
                      : 'Data: ${DateFormat.yMd('pt_BR').format(_selectedDate!)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: _showDatePicker,
                  icon: Icon(
                    Icons.date_range_outlined,
                    size: 34,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
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
