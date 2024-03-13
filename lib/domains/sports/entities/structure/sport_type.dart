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
  const Padel({super.name = 'padel', super.value = 0});
}

class Volleyball extends SportType {
  const Volleyball({super.name = 'volleyball', super.value = 0});
}

class Squash extends SportType {
  const Squash({super.name = 'squash', super.value = 0});
}

class Running extends SportType {
  const Running({super.name = 'running', super.value = 0});
}

class Tennis extends SportType {
  const Tennis({super.name = 'tennis', super.value = 0});
}

class Hiking extends SportType {
  const Hiking({super.name = 'hiking', super.value = 0});
}

class Climbing extends SportType {
  const Climbing({super.name = 'climbing', super.value = 0});
}

class Gym extends SportType {
  const Gym({super.name = 'gym', super.value = 0});
}

class Biking extends SportType {
  const Biking({super.name = 'biking', super.value = 0});
}
