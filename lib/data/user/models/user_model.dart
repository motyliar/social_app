import 'package:climbapp/data/user/models/sub_models/sub_models.dart';
import 'package:climbapp/domains/user/entities/sub_user_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
@HiveType(typeId: 1)
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    @HiveField(0) required String userAuthID,
    @HiveField(1) required String userName,
    @HiveField(2) required String userEmail,
    @HiveField(3) required bool isAdmin,
    @HiveField(4) required bool isUser,
    @HiveField(5) List<String>? friendsRequest,
    @HiveField(6) String? profileAvatar,
    @HiveField(7) UserDetailsModel? details,
    @HiveField(8) List<String>? userChallengesIDs,
    @HiveField(9) List<String>? messages,
    @HiveField(10) UserPreferencesModel? preferences,
    @HiveField(11) List<String>? friends,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  UserEntity toEntity() {
    return UserEntity(
      userAuthID: userAuthID,
      userName: userName,
      userEmail: userEmail,
      isAdmin: isAdmin,
      isUser: isUser,
      preferences: preferences?.mode != null && preferences?.language != null
          ? UserPreferencesEntity(
              mode: preferences!.mode!,
              language: preferences!.language!,
            )
          : null,
      profileAvatar: profileAvatar,
      friends: friends?.toList() ?? [],
      firendsRequest: friendsRequest?.toList() ?? [],
      messages: messages?.toList() ?? [],
      userChallengesIDs: userChallengesIDs?.toList() ?? [],
      details: details?.age != null &&
              details?.gender != null &&
              details?.phone != null
          ? UserDetailsEntity(
              age: details!.age,
              gender: details!.gender,
              phone: details!.phone,
            )
          : null,
    );
  }
}
