import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CurrencyBrlFormatter extends TextInputFormatter {
  static String format({required double value, String? symbol}) =>
      NumberFormat.simpleCurrency(locale: 'pt_BR', name: symbol).format(value);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    String newText =
        NumberFormat.simpleCurrency(locale: 'pt_BR').format(value / 100.0);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}