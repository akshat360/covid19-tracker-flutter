class NumberFormat {
  String intWord(number) {
    int length = number.toString().length;
    if (length <= 3)
      return number.toString();
    else if (length > 3 && length <= 6) {
      number = number / 1000;
      return "${number.toStringAsFixed(1)}K";
    } else if (length > 6 && length <= 9) {
      number = number / 1000000;
      return "${number.toStringAsFixed(1)}M";
    } else if (length > 9 && length <= 12) {
      number = number / 1000000000;
      return "${number.toStringAsFixed(1)}B";
    }
    return number.toString();
  }
}
