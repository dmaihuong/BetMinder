extension StringFixed on double {
  String get doubleToString {
    var amountText = toStringAsFixed(2);

    while (amountText.endsWith('0')) {
      amountText = amountText.substring(0, amountText.length - 1);
    }
    if (amountText.endsWith('.')) {
      amountText = amountText.substring(0, amountText.length - 1);
    }
    return amountText;
  }
}

extension JustDate on DateTime {
  DateTime get onlyDate => DateTime(year, month, day);
}
