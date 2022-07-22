import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyBrlMask extends TextInputFormatter {
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
