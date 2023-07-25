import 'package:intl/intl.dart';

class Formatter {
  static formatPrice(int price) {
    final numberFormat = NumberFormat("#,##,###");
    return numberFormat.format(price);
  }

  static formatDate(String datestr) {
    DateTime date = DateFormat('dd/MM/yy').parse(datestr);
    final dateFormat = DateFormat('MMMM d');
    return dateFormat.format(date);
  }
}
