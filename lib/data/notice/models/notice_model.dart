import 'package:freezed_annotation/freezed_annotation.dart';
import './sub_models/notice_submodels.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

@freezed
@HiveType(typeId: 7)
class NoticeModel with _$NoticeModel {
  const factory NoticeModel({
    @HiveField(0) @JsonKey(name: '_id') required String id,
    @HiveField(1) required String author,
    @HiveField(2) required String authorId,
    @HiveField(3) required String category,
    @HiveField(4) required ContentModel content,
    @HiveField(5) required CommentsModel comments,
    @HiveField(6) required String createdAt,
    @HiveField(7) required String updatedAt,
  }) = _NoticeModel;
  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);
}
