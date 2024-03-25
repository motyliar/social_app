import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_entity.freezed.dart';
part 'requests_entity.g.dart';

@freezed
class RequestsEntity with _$RequestsEntity {
  const factory RequestsEntity({
    required String id,
    required String userName,
    required String avatar,
  }) = _RequestsEntity;
  factory RequestsEntity.fromJson(Map<String, dynamic> json) =>
      _$RequestsEntityFromJson(json);
}
