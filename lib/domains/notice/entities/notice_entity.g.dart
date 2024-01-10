// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeEntityImpl _$$NoticeEntityImplFromJson(Map<String, dynamic> json) =>
    _$NoticeEntityImpl(
      id: json['id'] as String,
      author: json['author'] as String,
      authorId: json['authorId'] as String,
      category: json['category'] as String,
      content: ContentEntity.fromJson(json['content'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$NoticeEntityImplToJson(_$NoticeEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'authorId': instance.authorId,
      'category': instance.category,
      'content': instance.content,
      'comments': instance.comments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
