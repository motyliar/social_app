import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'category')
enum NoticeCategory {
  @JsonValue('football')
  football,
  @JsonValue('padel')
  padel,
  @JsonValue('volleyball')
  volleyball,
  @JsonValue('squash')
  squash,
  @JsonValue('climbing')
  climbing,
  @JsonValue('running')
  running,
  @JsonValue('tennis')
  tennis,
  @JsonValue('hiking')
  hiking,
  @JsonValue('gym')
  gym,
  @JsonValue('biking')
  biking,
  @JsonValue('general')
  general;

  List<NoticeCategory> toList() => NoticeCategory.values;
}
