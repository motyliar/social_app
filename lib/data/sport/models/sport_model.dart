import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'sport_model.freezed.dart';
part 'sport_model.g.dart';

@freezed
@HiveType(typeId: 12)
class SportModel with _$SportModel {
  const SportModel._();
  const factory SportModel({
    @HiveField(0) required String userId,
    @HiveField(1) required int football,
    @HiveField(2) required int padel,
    @HiveField(3) required int volleyball,
    @HiveField(4) required int squash,
    @HiveField(5) required int running,
    @HiveField(6) required int tennis,
    @HiveField(7) required int hiking,
    @HiveField(8) required int climbing,
    @HiveField(9) required int gym,
    @HiveField(10) required int biking,
  }) = _SportModel;
  factory SportModel.fromJson(Map<String, dynamic> json) =>
      _$SportModelFromJson(json);

  SportEntity toEntity() => SportEntity(
      userId: userId,
      football: football,
      padel: padel,
      volleyball: volleyball,
      squash: squash,
      running: running,
      tennis: tennis,
      hiking: hiking,
      climbing: climbing,
      gym: gym,
      biking: biking);
}
