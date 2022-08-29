import 'package:intl/intl.dart';

class Formatter {
  static String digitFormatter(int digit) {
    String num;
    if (digit > 1000) {
      num = NumberFormat('#,##,000').format(digit);
    } else {
      num = digit.toString();
    }
    return num;
  }
}
