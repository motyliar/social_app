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
    @HiveField(3) required String subject,
    @HiveField(4) required String content,
    @HiveField(5) required bool isRead,
    @HiveField(6) required bool isReply,
    @HiveField(7) required String createdAt,
    @HiveField(8) required String updatedAt,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      to: to,
      from: from,
      subject: subject,
      content: content,
      isRead: isRead,
      isReply: isReply,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
