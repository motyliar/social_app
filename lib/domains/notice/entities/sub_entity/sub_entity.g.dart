// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentEntityImpl _$$ContentEntityImplFromJson(Map<String, dynamic> json) =>
    _$ContentEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$ContentEntityImplToJson(_$ContentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'price': instance.price,
    };

_$CommentsEntityImpl _$$CommentsEntityImplFromJson(Map<String, dynamic> json) =>
    _$CommentsEntityImpl(
      id: json['id'] as String,
      user: json['user'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      likes: json['likes'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$CommentsEntityImplToJson(
        _$CommentsEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'userId': instance.userId,
      'content': instance.content,
      'likes': instance.likes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
