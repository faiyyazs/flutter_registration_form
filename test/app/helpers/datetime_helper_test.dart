import 'package:flutter_test/flutter_test.dart';
import 'package:registration_form/app/helpers/datetimehelper.dart';

void main() {
  group('DateTimeHelper', () {
    test('convertDateTime_customFormatReturned', () {
      DateTime dateTime = DateTime(2020,6,3);

      expect(DateTimeHelper.convertDateTimeToCustomFormatDate(dateTime),
          "03-06-2020");
    });
  });
}
