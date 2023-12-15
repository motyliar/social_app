// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendsEntityImpl _$$FriendsEntityImplFromJson(Map<String, dynamic> json) =>
    _$FriendsEntityImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
      profileAvatar: json['profileAvatar'] as String,
      isActive: json['isActive'] as bool,
      lastLoggedIn: json['lastLoggedIn'] as String,
    );

Map<String, dynamic> _$$FriendsEntityImplToJson(_$FriendsEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'profileAvatar': instance.profileAvatar,
      'isActive': instance.isActive,
      'lastLoggedIn': instance.lastLoggedIn,
    };
