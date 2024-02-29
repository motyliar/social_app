import 'package:equatable/equatable.dart';

class Sport extends Equatable {
  Sport({
    required this.name,
    this.value = 0,
  });
  final String name;
  int value;

  Sport copyWith({int? value}) => Sport(
        name: name,
        value: value ?? this.value,
      );

  @override
  String toString() => 'Name: $name, value: $value';
  @override
  List<Object> get props => [value, name];
}

List<Sport> sportsList = [
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

class SportsList extends Equatable {
  SportsList({required this.sports});
  List<Sport> sports;

  SportsList copyWith({List<Sport>? sports}) =>
      SportsList(sports: sports ?? this.sports);
  @override
  List<Object> get props => [sports];
}
