import 'package:intl/intl.dart';

class DateTimeHelper {
  static String convertDateTimeToCustomFormatDate(DateTime dateTime) {
    DateFormat calendarFormat = DateFormat('dd-MM-yyyy');
    return calendarFormat.format(dateTime);
  }
}
