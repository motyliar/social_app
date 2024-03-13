class SportType {
  const SportType({required this.name, required this.value});
  final String name;
  final int value;

  SportType copyWith({String? name, int? value}) =>
      SportType(name: name ?? this.name, value: value ?? this.value);
  @override
  toString() => 'name: $name, value: $value';
}

class Football extends SportType {
  const Football({super.name = 'football', super.value = 0});
}

class Padel extends SportType {
  const Padel({super.name = 'Padel', super.value = 0});
}

class Volleyball extends SportType {
  const Volleyball({super.name = 'Volleyball', super.value = 0});
}

class Squash extends SportType {
  const Squash({super.name = 'Squash', super.value = 0});
}

class Running extends SportType {
  const Running({super.name = 'Running', super.value = 0});
}

class Tennis extends SportType {
  const Tennis({super.name = 'Tennis', super.value = 0});
}

class Hiking extends SportType {
  const Hiking({super.name = 'Hiking', super.value = 0});
}

class Climbing extends SportType {
  const Climbing({super.name = 'Climbing', super.value = 0});
}

class Gym extends SportType {
  const Gym({super.name = 'Gym', super.value = 0});
}

class Biking extends SportType {
  const Biking({super.name = 'Biking', super.value = 0});
}
