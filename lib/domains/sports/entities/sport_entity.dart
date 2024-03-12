import 'package:freezed_annotation/freezed_annotation.dart';
part 'sport_entity.freezed.dart';
part 'sport_entity.g.dart';

@freezed
class SportEntity with _$SportEntity {
  const factory SportEntity({
    required String userId,
    required int football,
    required int padel,
    required int volleyball,
    required int squash,
    required int running,
    required int tennis,
    required int hiking,
    required int climbing,
    required int gym,
    required int biking,
  }) = _SportEntity;
  factory SportEntity.fromJson(Map<String, dynamic> json) =>
      _$SportEntityFromJson(json);
}
