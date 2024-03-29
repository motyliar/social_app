// ignore_for_file: invalid_annotation_target

import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
@HiveType(typeId: 6)
class MessageModel with _$MessageModel {
  const MessageModel._();
  const factory MessageModel({
    @HiveField(0) @JsonKey(name: "_id") required String id,
    @HiveField(1) required String to,
    @HiveField(2) required String from,
    @HiveField(3) required String sender,
    @HiveField(4) required String recipient,
    @HiveField(5) required String subject,
    @HiveField(6) required String content,
    @HiveField(7) required bool isRead,
    @HiveField(8) required bool isReply,
    @HiveField(9) required String createdAt,
    @HiveField(10) required String updatedAt,
    @HiveField(11) List<AvatarsModel>? avatars,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() {
    return MessageEntity(
        id: id,
        to: to,
        from: from,
        sender: sender,
        recipient: recipient,
        subject: subject,
        content: content,
        isRead: isRead,
        isReply: isReply,
        createdAt: createdAt,
        updatedAt: updatedAt,
        avatars: avatars
                ?.map((e) => Avatars(id: e.id, profileAvatar: e.profileAvatar))
                .toList() ??
            <Avatars>[]);
  }
}

@freezed
@HiveType(typeId: 11)
class AvatarsModel with _$AvatarsModel {
  const AvatarsModel._();
  const factory AvatarsModel({
    @HiveField(0) required String id,
    @HiveField(1) required String profileAvatar,
  }) = _AvatarsModel;
  factory AvatarsModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarsModelFromJson(json);

  List<Avatars> toEntity(List<AvatarsModel> models) => models
      .map((e) => Avatars(id: e.id, profileAvatar: e.profileAvatar))
      .toList();
}
