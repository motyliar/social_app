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
    );
  }

  @override
  void write(BinaryWriter writer, NoticeModel obj) {
    writer
      ..writeByte(8)
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
      ..write(obj.updatedAt);
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
    };
