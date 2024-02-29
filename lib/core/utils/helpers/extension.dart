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

extension TooLongText on String {
  String isTooLong(int index) {
    if (length > index) {
      return substring(0, index);
    } else {
      return this;
    }
  }
}

extension MoreThen300Letters on String {
  String get cut {
    if (length > 300) {
      return '''${substring(0, 300)}...''';
    } else {
      return this;
    }
  }
}

extension IsTooLong on String {
  bool isLongThen({int index = 300}) {
    if (length > index) {
      return true;
    } else {
      return false;
    }
  }
}
