import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'friends_model.freezed.dart';
part 'friends_model.g.dart';

@freezed
@HiveType(typeId: 5)
class FriendsModel with _$FriendsModel {
  const FriendsModel._();
  const factory FriendsModel({
    @HiveField(0) @JsonKey(name: '_id') required String id,
    @HiveField(1) required String userName,
    @HiveField(2) required String profileAvatar,
    @HiveField(3) required bool isActive,
    @HiveField(4) required String lastLoggedIn,
  }) = _FriendsModel;
  factory FriendsModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsModelFromJson(json);

  FriendsEntity toEntity() {
    return FriendsEntity(
      id: id,
      userName: userName,
      profileAvatar: profileAvatar,
      isActive: isActive,
      lastLoggedIn: lastLoggedIn,
    );
  }

  List<FriendsEntity> toEntityFromList(
      {required List<FriendsModel> friendsModel}) {
    return friendsModel.map((friends) => friends.toEntity()).toList();
  }
}
