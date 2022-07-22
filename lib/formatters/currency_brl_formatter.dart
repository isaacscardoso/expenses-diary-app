import 'package:intl/intl.dart';

class CurrencyBrlFormatter {
  static String format({required double value, String? symbol}) =>
      NumberFormat.simpleCurrency(locale: 'pt_BR', name: symbol).format(value);
}
