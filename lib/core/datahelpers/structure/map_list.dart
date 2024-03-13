// import 'package:climbapp/domains/sports/entities/sport_entity.dart';

// enum SportsType {
//   football,
//   padel,
//   volleyball,
//   squash,
//   running,
//   tennis,
//   hiking,
//   climbing,
//   gym,
//   biking,
// }

// const String _sportValue = 'value';
// const String _sportName = 'name';

// class SportMap {
//   const SportMap() : _data = const <Map<String, dynamic>>[];
//   final List<Map<String, dynamic>> _data;

//   void toList(SportEntity sport) => _data.addAll([
//         {_sportValue: sport.football, _sportName: SportsType.football.name},
//         {_sportValue: sport.padel, _sportName: SportsType.padel.name},
//         {_sportValue: sport.volleyball, _sportName: SportsType.volleyball.name},
//         {_sportValue: sport.squash, _sportName: SportsType.squash.name},
//         {_sportValue: sport.running, _sportName: SportsType.running.name},
//         {_sportValue: sport.tennis, _sportName: SportsType.tennis.name},
//         {_sportValue: sport.hiking, _sportName: SportsType.hiking.name},
//         {_sportValue: sport.climbing, _sportName: SportsType.climbing.name},
//         {_sportValue: sport.gym, _sportName: SportsType.gym.name},
//         {_sportValue: sport.biking, _sportName: SportsType.biking.name},
//       ]);

//   List<Map<String, dynamic>> greaterThen({int value = 0}) =>
//       _data.where((e) => e[_sportValue] > value).toList();
//   List<Map<String, dynamic>> equals({int value = 0}) =>
//       _data.where((e) => e[_sportName] == value).toList();
//   Map<String, dynamic> toJson(String userId) {
//     Map<String, dynamic> toJson = {
//       'userId': userId,
//     };
//     for (var sport in _data) {
//       toJson[sport[_sportName]] = sport[_sportValue];
//     }
//     return toJson;
//   }

//   void update(int value, String name) => _data.forEach((element) {
//         if (element[_sportName] == name) {
//           element[_sportValue] = value;
//         }
//       });
// }


