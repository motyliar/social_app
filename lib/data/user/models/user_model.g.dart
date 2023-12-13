// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      userAuthID: fields[0] as String,
      userName: fields[1] as String,
      userEmail: fields[2] as String,
      isAdmin: fields[3] as bool,
      isUser: fields[4] as bool,
      active: fields[5] as UserActiveModel,
      profileAvatar: fields[6] as String?,
      details: fields[7] as UserDetailsModel?,
      userChallengesIDs: (fields[8] as List?)?.cast<String>(),
      messages: (fields[9] as List?)?.cast<String>(),
      preferences: fields[10] as UserPreferencesModel?,
      friends: (fields[11] as List?)?.cast<String>(),
      friendsRequest: (fields[12] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.userAuthID)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userEmail)
      ..writeByte(3)
      ..write(obj.isAdmin)
      ..writeByte(4)
      ..write(obj.isUser)
      ..writeByte(5)
      ..write(obj.active)
      ..writeByte(6)
      ..write(obj.profileAvatar)
      ..writeByte(7)
      ..write(obj.details)
      ..writeByte(8)
      ..write(obj.userChallengesIDs)
      ..writeByte(9)
      ..write(obj.messages)
      ..writeByte(10)
      ..write(obj.preferences)
      ..writeByte(11)
      ..write(obj.friends)
      ..writeByte(12)
      ..write(obj.friendsRequest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userAuthID: json['userAuthID'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      isAdmin: json['isAdmin'] as bool,
      isUser: json['isUser'] as bool,
      active: UserActiveModel.fromJson(json['active'] as Map<String, dynamic>),
      profileAvatar: json['profileAvatar'] as String?,
      details: json['details'] == null
          ? null
          : UserDetailsModel.fromJson(json['details'] as Map<String, dynamic>),
      userChallengesIDs: (json['userChallengesIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      preferences: json['preferences'] == null
          ? null
          : UserPreferencesModel.fromJson(
              json['preferences'] as Map<String, dynamic>),
      friends:
          (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
      friendsRequest: (json['friendsRequest'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userAuthID': instance.userAuthID,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'isAdmin': instance.isAdmin,
      'isUser': instance.isUser,
      'active': instance.active,
      'profileAvatar': instance.profileAvatar,
      'details': instance.details,
      'userChallengesIDs': instance.userChallengesIDs,
      'messages': instance.messages,
      'preferences': instance.preferences,
      'friends': instance.friends,
      'friendsRequest': instance.friendsRequest,
    };
