import 'package:flutter_test/flutter_test.dart';
import 'package:registration_form/app/helpers/regexhelper.dart';

void main() {
  group('RegexHelper', () {

    test('isNumeric_textContainAlphabet_falseReturned', () {
      expect(RegexHelper.isNumeric("34345435t"),false);
    });

    test('isNumeric_textContainSymbol_falseReturned', () {
      expect(RegexHelper.isNumeric("787!2345"),false);
    });

    test('isNumeric_numeric_trueReturned', () {
      expect(RegexHelper.isNumeric("98712345656"),true);
    });


  });
}
