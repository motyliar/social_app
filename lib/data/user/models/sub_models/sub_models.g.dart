// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPreferencesModelAdapter extends TypeAdapter<UserPreferencesModel> {
  @override
  final int typeId = 2;

  @override
  UserPreferencesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPreferencesModel(
      mode: fields[0] as bool?,
      language: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPreferencesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mode)
      ..writeByte(1)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferencesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDetailsModelAdapter extends TypeAdapter<UserDetailsModel> {
  @override
  final int typeId = 3;

  @override
  UserDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsModel(
      age: fields[0] as int?,
      gender: fields[1] as String?,
      phone: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesModelImpl _$$UserPreferencesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesModelImpl(
      mode: json['mode'] as bool?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$UserPreferencesModelImplToJson(
        _$UserPreferencesModelImpl instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'language': instance.language,
    };

_$UserDetailsModelImpl _$$UserDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailsModelImpl(
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$UserDetailsModelImplToJson(
        _$UserDetailsModelImpl instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'phone': instance.phone,
    };

_$UserFriendsModelImpl _$$UserFriendsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserFriendsModelImpl(
      userId: json['userId'] as String,
      userAvatar: json['userAvatar'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$UserFriendsModelImplToJson(
        _$UserFriendsModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userAvatar': instance.userAvatar,
      'userName': instance.userName,
    };
