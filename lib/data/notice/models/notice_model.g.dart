// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoticeModelAdapter extends TypeAdapter<NoticeModel> {
  @override
  final int typeId = 7;

  @override
  NoticeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoticeModel(
      id: fields[0] as String,
      author: fields[1] as String,
      authorId: fields[2] as String,
      category: fields[3] as String,
      content: fields[4] as ContentModel,
      comments: (fields[5] as List?)?.cast<CommentsModel>(),
      createdAt: fields[6] as String,
      updatedAt: fields[7] as String,
      avatar: fields[8] as String,
      type: fields[9] as String,
      requests: (fields[10] as List?)?.cast<String>(),
      interested: (fields[11] as List?)?.cast<String>(),
      image: fields[12] as String?,
      isActive: fields[13] as bool,
      localization: fields[14] as String?,
      resolutions: (fields[15] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, NoticeModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.authorId)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.comments)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.requests)
      ..writeByte(11)
      ..write(obj.interested)
      ..writeByte(12)
      ..write(obj.image)
      ..writeByte(13)
      ..write(obj.isActive)
      ..writeByte(14)
      ..write(obj.localization)
      ..writeByte(15)
      ..write(obj.resolutions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoticeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeModelImpl _$$NoticeModelImplFromJson(Map<String, dynamic> json) =>
    _$NoticeModelImpl(
      id: json['_id'] as String,
      author: json['author'] as String,
      authorId: json['authorId'] as String,
      category: json['category'] as String,
      content: ContentModel.fromJson(json['content'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      avatar: json['avatar'] as String,
      type: json['type'] as String,
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      interested: (json['interested'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      isActive: json['isActive'] as bool,
      localization: json['localization'] as String?,
      resolutions: (json['resolutions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$NoticeModelImplToJson(_$NoticeModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'authorId': instance.authorId,
      'category': instance.category,
      'content': instance.content,
      'comments': instance.comments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'avatar': instance.avatar,
      'type': instance.type,
      'requests': instance.requests,
      'interested': instance.interested,
      'image': instance.image,
      'isActive': instance.isActive,
      'localization': instance.localization,
      'resolutions': instance.resolutions,
    };
