// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationModelAdapter extends TypeAdapter<NotificationModel> {
  @override
  final int typeId = 13;

  @override
  NotificationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      eventId: fields[2] as String,
      authorId: fields[3] as String,
      authorAvatar: fields[4] as String,
      authorName: fields[5] as String,
      category: fields[6] as String,
      isPositive: fields[7] as bool,
      isRead: fields[8] as bool,
      createdAt: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.eventId)
      ..writeByte(3)
      ..write(obj.authorId)
      ..writeByte(4)
      ..write(obj.authorAvatar)
      ..writeByte(5)
      ..write(obj.authorName)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.isPositive)
      ..writeByte(8)
      ..write(obj.isRead)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['_id'] as String,
      userId: json['user_id'] as String,
      eventId: json['event_id'] as String,
      authorId: json['author_id'] as String,
      authorAvatar: json['authorAvatar'] as String,
      authorName: json['authorName'] as String,
      category: json['category'] as String,
      isPositive: json['isPositive'] as bool,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'event_id': instance.eventId,
      'author_id': instance.authorId,
      'authorAvatar': instance.authorAvatar,
      'authorName': instance.authorName,
      'category': instance.category,
      'isPositive': instance.isPositive,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
    };
