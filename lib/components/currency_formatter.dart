import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String currencyToBrl(double value) {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(value);
  }
}
