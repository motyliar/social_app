import 'package:freezed_annotation/freezed_annotation.dart';
part 'sub_entity.freezed.dart';
part 'sub_entity.g.dart';

@freezed
class ContentEntity with _$ContentEntity {
  const factory ContentEntity({
    required String id,
    required String title,
    required String content,
    String? when,
    int? price,
  }) = _ContentEntity;
  factory ContentEntity.fromJson(Map<String, dynamic> json) =>
      _$ContentEntityFromJson(json);
}

@freezed
class CommentsEntity with _$CommentsEntity {
  const factory CommentsEntity({
    required String id,
    required String user,
    required String userId,
    required String content,
    required int likes,
    required String avatar,
    required String createdAt,
    required String updatedAt,
  }) = _CommentsEntity;
  factory CommentsEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentsEntityFromJson(json);
}
