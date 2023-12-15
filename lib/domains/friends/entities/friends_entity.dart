import 'package:freezed_annotation/freezed_annotation.dart';
part 'friends_entity.freezed.dart';
part 'friends_entity.g.dart';

@freezed
class FriendsEntity with _$FriendsEntity {
  const factory FriendsEntity(
      {required String id,
      required String userName,
      required String profileAvatar,
      required bool isActive,
      required String lastLoggedIn}) = _FriendsEntity;
  factory FriendsEntity.fromJson(Map<String, dynamic> json) =>
      _$FriendsEntityFromJson(json);
}
