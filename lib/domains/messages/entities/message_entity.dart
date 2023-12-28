import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_entity.freezed.dart';
part 'message_entity.g.dart';

@freezed
class MessageEntity with _$MessageEntity {
  const factory MessageEntity(
      {required String id,
      required String to,
      required String from,
      required String sender,
      required String recipient,
      required String subject,
      required String content,
      required bool isRead,
      required bool isReply,
      required String createdAt,
      required String updatedAt}) = _MessageEntity;
  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
}
