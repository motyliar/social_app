// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SportEntityImpl _$$SportEntityImplFromJson(Map<String, dynamic> json) =>
    _$SportEntityImpl(
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

Map<String, dynamic> _$$SportEntityImplToJson(_$SportEntityImpl instance) =>
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
