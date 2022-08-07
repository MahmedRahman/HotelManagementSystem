import 'package:intl/intl.dart';

extension DateFormatEx on String {
  String timeFromString() {
    return DateFormat('hh:mm a')
        .format(
          DateTime.parse(this),
        )
        .toString();
  }

  String dateFromString() {
    return DateFormat('dd/MM/yyyy')
        .format(
          DateTime.parse(this),
        )
        .toString();
  }
}

class test {
  test() {
    String x = '2022-05-16T10:48:37.59';
    x.timeFromString();
  }
}
