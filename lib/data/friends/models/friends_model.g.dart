// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FriendsModelAdapter extends TypeAdapter<FriendsModel> {
  @override
  final int typeId = 5;

  @override
  FriendsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FriendsModel(
      id: fields[0] as String,
      userName: fields[1] as String,
      profileAvatar: fields[2] as String,
      isActive: fields[3] as bool,
      lastLoggedIn: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FriendsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.profileAvatar)
      ..writeByte(3)
      ..write(obj.isActive)
      ..writeByte(4)
      ..write(obj.lastLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendsModelImpl _$$FriendsModelImplFromJson(Map<String, dynamic> json) =>
    _$FriendsModelImpl(
      id: json['id'] as String,
      userName: json['userName'] as String,
      profileAvatar: json['profileAvatar'] as String,
      isActive: json['isActive'] as bool,
      lastLoggedIn: json['lastLoggedIn'] as String,
    );

Map<String, dynamic> _$$FriendsModelImplToJson(_$FriendsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'profileAvatar': instance.profileAvatar,
      'isActive': instance.isActive,
      'lastLoggedIn': instance.lastLoggedIn,
    };
