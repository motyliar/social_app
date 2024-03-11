import 'package:climbapp/domains/user/entities/sub_user_entity.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'sub_models.freezed.dart';
part 'sub_models.g.dart';

@freezed
@HiveType(typeId: 2)
class UserPreferencesModel with _$UserPreferencesModel {
  const factory UserPreferencesModel({
    @HiveField(0) bool? mode,
    @HiveField(1) String? language,
  }) = _UserPreferencesModel;
  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);
}

@freezed
@HiveType(typeId: 3)
class UserDetailsModel with _$UserDetailsModel {
  const UserDetailsModel._();
  const factory UserDetailsModel({
    @HiveField(0) int? age,
    @HiveField(1) String? gender,
    @HiveField(2) String? phone,
  }) = _UserDetailsModel;
  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsModelFromJson(json);

  UserDetailsEntity toEntity() => UserDetailsEntity(
      age: age ?? 0, gender: gender ?? 'M', phone: phone ?? '999 999 999');
}

@freezed
class UserFriendsModel with _$UserFriendsModel {
  const factory UserFriendsModel({
    required String userId,
    required String userAvatar,
    required String userName,
  }) = _UserFriendsModel;
  factory UserFriendsModel.fromJson(Map<String, dynamic> json) =>
      _$UserFriendsModelFromJson(json);
}

@freezed
@HiveType(typeId: 4)
class UserActiveModel with _$UserActiveModel {
  const factory UserActiveModel({
    @HiveField(0) @Default(false) bool isActive,
    @HiveField(1) @Default('0000 00 00') String lastLoggedIn,
  }) = _UserActiveModel;
  factory UserActiveModel.fromJson(Map<String, dynamic> json) =>
      _$UserActiveModelFromJson(json);
}
