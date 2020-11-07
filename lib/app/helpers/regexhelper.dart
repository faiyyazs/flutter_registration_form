class RegexHelper {
  static bool isNumeric(String text) {
    return RegExp(r'^[0-9]*$').hasMatch(text.trim());
  }
}
