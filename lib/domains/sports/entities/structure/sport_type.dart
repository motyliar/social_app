class SportType {
  const SportType({required this.name, this.value = 0});
  final String name;
  final int value;

  SportType copyWith({String? name, int? value}) =>
      SportType(name: name ?? this.name, value: value ?? this.value);
  @override
  toString() => 'name: $name, value: $value';
}

class Football extends SportType {
  const Football({super.name = 'football', super.value});
}

class Padel extends SportType {
  const Padel({super.name = 'padel', super.value});
}

class Volleyball extends SportType {
  const Volleyball({super.name = 'volleyball', super.value});
}

class Squash extends SportType {
  const Squash({super.name = 'squash', super.value});
}

class Running extends SportType {
  const Running({super.name = 'running', super.value});
}

class Tennis extends SportType {
  const Tennis({super.name = 'tennis', super.value});
}

class Hiking extends SportType {
  const Hiking({super.name = 'hiking', super.value});
}

class Climbing extends SportType {
  const Climbing({super.name = 'climbing', super.value});
}

class Gym extends SportType {
  const Gym({super.name = 'gym', super.value});
}

class Biking extends SportType {
  const Biking({super.name = 'biking', super.value});
}
