import 'package:freezed_annotation/freezed_annotation.dart';
import './sub_entity/sub_entity.dart';
part 'notice_entity.freezed.dart';
part 'notice_entity.g.dart';

@freezed
class NoticeEntity with _$NoticeEntity {
  const factory NoticeEntity({
    required String id,
    required String author,
    required String authorId,
    required String category,
    required ContentEntity content,
    List<CommentsEntity>? comments,
    required String createdAt,
    required String updatedAt,
  }) = _NoticeEntity;
  factory NoticeEntity.fromJson(Map<String, dynamic> json) =>
      _$NoticeEntityFromJson(json);
}
