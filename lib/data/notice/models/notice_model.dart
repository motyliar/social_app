import 'package:climbapp/domains/notice/entities/notice_conventer.dart/notice_separator.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import './sub_models/notice_submodels.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

@freezed
@HiveType(typeId: 7)
class NoticeModel with _$NoticeModel {
  const NoticeModel._();
  const factory NoticeModel({
    @HiveField(0) @JsonKey(name: '_id') required String id,
    @HiveField(1) required String author,
    @HiveField(2) required String authorId,
    @HiveField(3) required String category,
    @HiveField(4) required ContentModel content,
    @HiveField(5) List<CommentsModel>? comments,
    @HiveField(6) required String createdAt,
    @HiveField(7) required String updatedAt,
    @HiveField(8) required String avatar,
    @HiveField(9) required String type,
    @HiveField(10) List<String>? requests,
    @HiveField(11) List<String>? interested,
    @HiveField(12) String? image,
    @HiveField(13) required bool isActive,
    @HiveField(14) String? localization,
  }) = _NoticeModel;
  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);

  NoticeEntity toEntity() => NoticeEntity(
      id: id,
      author: author,
      authorId: authorId,
      category: NoticeSeparator.convertToCategory(category),
      content: content.toEntity(),
      comments: comments!
          .map((e) => CommentsEntity(
              id: e.id,
              user: e.user,
              userId: e.userId,
              content: e.content,
              likes: e.likes,
              createdAt: e.createdAt,
              updatedAt: e.updatedAt))
          .toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      avatar: avatar,
      type: NoticeSeparator.convertToType(type),
      requests: requests?.toList() ?? [],
      interested: interested?.toList() ?? [],
      isActive: isActive,
      localization: localization ?? '');
}
