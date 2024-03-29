import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:climbapp/domains/sports/entities/structure/sport_type.dart';

enum SportsType {
  football,
  padel,
  volleyball,
  squash,
  running,
  tennis,
  hiking,
  climbing,
  gym,
  biking,
}

const String _sportValue = 'value';
const String _sportName = 'name';

class SportMap {
  SportMap() : _data = <SportType>[];
  final List<SportType> _data;

  List<SportType> get getList => _data;
  SportMap fetchData(SportEntity sport) {
    toList(sport);
    return this;
  }

  void toList(SportEntity sport) => _data.addAll([
        Football(value: sport.football),
        Padel(value: sport.padel),
        Volleyball(value: sport.volleyball),
        Squash(value: sport.squash),
        Running(value: sport.running),
        Tennis(value: sport.tennis),
        Hiking(value: sport.hiking),
        Climbing(value: sport.climbing),
        Gym(value: sport.gym),
        Biking(value: sport.biking),
      ]);

  String getValue(int index) => _data[index].value.toString();

  List<SportType> greaterThen({int value = 0}) =>
      _data.where((e) => e.value > value).toList();

  List<SportType> equals({int value = 0}) =>
      _data.where((e) => e.value == value).toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {};
    for (var sport in _data) {
      toJson[sport.name] = sport.value;
    }
    return toJson;
  }

  SportMap update(int value, String name) {
    for (var element in _data) {
      if (element.name.toLowerCase() == name.toLowerCase()) {
        _data[_data.indexOf(element)] = element.copyWith(value: value);
      }
    }
    return this;
  }

  @override
  toString() => '$_data';
}
