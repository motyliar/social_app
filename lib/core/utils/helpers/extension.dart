extension CapitalizeFirstLetter on String {
  String capitalize() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : this;
  }
}

extension CapitalizeOneLetter on String {
  String oneLetter(int index) {
    if (index > length) {
      throw Exception('too long');
    }

    final end = index + 1;
    final word = toLowerCase();
    return isNotEmpty
        ? '${substring(0, index)}${word[index].toUpperCase()}${substring(
            end,
            word.length,
          )}'
        : this;
  }
}
