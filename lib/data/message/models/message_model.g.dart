// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageModelAdapter extends TypeAdapter<MessageModel> {
  @override
  final int typeId = 6;

  @override
  MessageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageModel(
      id: fields[0] as String,
      to: fields[1] as String,
      from: fields[2] as String,
      sender: fields[3] as String,
      recipient: fields[4] as String,
      subject: fields[5] as String,
      content: fields[6] as String,
      isRead: fields[7] as bool,
      isReply: fields[8] as bool,
      createdAt: fields[9] as String,
      updatedAt: fields[10] as String,
      avatars: (fields[11] as List?)?.cast<AvatarsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MessageModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.to)
      ..writeByte(2)
      ..write(obj.from)
      ..writeByte(3)
      ..write(obj.sender)
      ..writeByte(4)
      ..write(obj.recipient)
      ..writeByte(5)
      ..write(obj.subject)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.isRead)
      ..writeByte(8)
      ..write(obj.isReply)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.avatars);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AvatarsModelAdapter extends TypeAdapter<AvatarsModel> {
  @override
  final int typeId = 11;

  @override
  AvatarsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvatarsModel(
      id: fields[0] as String,
      profileAvatar: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AvatarsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profileAvatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvatarsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['_id'] as String,
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
          ?.map((e) => AvatarsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
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

_$AvatarsModelImpl _$$AvatarsModelImplFromJson(Map<String, dynamic> json) =>
    _$AvatarsModelImpl(
      id: json['id'] as String,
      profileAvatar: json['profileAvatar'] as String,
    );

Map<String, dynamic> _$$AvatarsModelImplToJson(_$AvatarsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileAvatar': instance.profileAvatar,
    };
