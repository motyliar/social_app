class Sport {
  const Sport({
    required this.name,
    this.value = 0,
  });
  final String name;
  final int value;
}

const List<Sport> sportsList = [
  Sport(
    name: 'Climbing',
  ),
  Sport(name: 'Padel'),
  Sport(name: 'Tenis'),
  Sport(name: 'Football'),
  Sport(name: 'Running'),
  Sport(name: 'Biking'),
  Sport(name: 'Squash'),
  Sport(name: 'Hiking'),
];
