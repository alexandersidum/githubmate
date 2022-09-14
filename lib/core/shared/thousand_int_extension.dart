extension ThousandToKExetension on num {
  toKString([int decimal = 1]) {
    if (this < 1000) {
      return toString();
    }

    final result = this / 1000;
    return result.toStringAsFixed(decimal) + 'k';
  }
}
