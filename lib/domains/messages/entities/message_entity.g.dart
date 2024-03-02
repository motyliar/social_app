// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageEntityImpl _$$MessageEntityImplFromJson(Map<String, dynamic> json) =>
    _$MessageEntityImpl(
      id: json['id'] as String,
      to: json['to'] as String,
      from: json['from'] as String,
      sender: json['sender'] as String,
      recipient: json['recipient'] as String,
      subject: json['subject'] as String,
      content: json['content'] as String,
      isRead: json['isRead'] as bool,
      isReply: json['isReply'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      avatars: (json['avatars'] as List<dynamic>?)
          ?.map((e) => Avatars.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageEntityImplToJson(_$MessageEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'to': instance.to,
      'from': instance.from,
      'sender': instance.sender,
      'recipient': instance.recipient,
      'subject': instance.subject,
      'content': instance.content,
      'isRead': instance.isRead,
      'isReply': instance.isReply,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'avatars': instance.avatars,
    };

_$AvatarsImpl _$$AvatarsImplFromJson(Map<String, dynamic> json) =>
    _$AvatarsImpl(
      id: json['id'] as String,
      profileAvatar: json['profileAvatar'] as String,
    );

Map<String, dynamic> _$$AvatarsImplToJson(_$AvatarsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileAvatar': instance.profileAvatar,
    };
