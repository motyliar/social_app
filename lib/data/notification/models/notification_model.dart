// ignore_for_file: invalid_annotation_target

import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/domains/notification/entities/sub_entity/type_distr.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
@HiveType(typeId: 13)
class NotificationModel with _$NotificationModel {
  const NotificationModel._();
  const factory NotificationModel({
    @HiveField(0) @JsonKey(name: '_id') required String id,
    @HiveField(1) @JsonKey(name: 'user_id') required String userId,
    @HiveField(2) @JsonKey(name: 'event_id') required String eventId,
    @HiveField(3) @JsonKey(name: 'author_id') required String authorId,
    @HiveField(4) required String authorAvatar,
    @HiveField(5) required String authorName,
    @HiveField(6) required String category,
    @HiveField(7) required bool isPositive,
    @HiveField(8) required bool isRead,
    @HiveField(9) required String createdAt,
  }) = _NotificationModel;
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      userId: userId,
      eventId: eventId,
      authorId: authorId,
      authorAvatar: authorAvatar,
      category: TypeDistributor.getType(category, isPositive, authorName),
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}
