// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SportModelAdapter extends TypeAdapter<SportModel> {
  @override
  final int typeId = 12;

  @override
  SportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SportModel(
      userId: fields[0] as String,
      football: fields[1] as int,
      padel: fields[2] as int,
      volleyball: fields[3] as int,
      squash: fields[4] as int,
      running: fields[5] as int,
      tennis: fields[6] as int,
      hiking: fields[7] as int,
      climbing: fields[8] as int,
      gym: fields[9] as int,
      biking: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SportModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.football)
      ..writeByte(2)
      ..write(obj.padel)
      ..writeByte(3)
      ..write(obj.volleyball)
      ..writeByte(4)
      ..write(obj.squash)
      ..writeByte(5)
      ..write(obj.running)
      ..writeByte(6)
      ..write(obj.tennis)
      ..writeByte(7)
      ..write(obj.hiking)
      ..writeByte(8)
      ..write(obj.climbing)
      ..writeByte(9)
      ..write(obj.gym)
      ..writeByte(10)
      ..write(obj.biking);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SportModelImpl _$$SportModelImplFromJson(Map<String, dynamic> json) =>
    _$SportModelImpl(
      userId: json['userId'] as String,
      football: json['football'] as int,
      padel: json['padel'] as int,
      volleyball: json['volleyball'] as int,
      squash: json['squash'] as int,
      running: json['running'] as int,
      tennis: json['tennis'] as int,
      hiking: json['hiking'] as int,
      climbing: json['climbing'] as int,
      gym: json['gym'] as int,
      biking: json['biking'] as int,
    );

Map<String, dynamic> _$$SportModelImplToJson(_$SportModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'football': instance.football,
      'padel': instance.padel,
      'volleyball': instance.volleyball,
      'squash': instance.squash,
      'running': instance.running,
      'tennis': instance.tennis,
      'hiking': instance.hiking,
      'climbing': instance.climbing,
      'gym': instance.gym,
      'biking': instance.biking,
    };
