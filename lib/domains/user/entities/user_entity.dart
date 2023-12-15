import 'package:climbapp/domains/user/entities/sub_user_entity.dart';

class UserEntity {
  const UserEntity({
    required this.id,
    required this.userAuthID,
    required this.userName,
    required this.userEmail,
    required this.active,
    this.preferences,
    this.profileAvatar,
    this.isAdmin = false,
    this.isUser = true,
    this.details,
    this.friends = const <String>[],
    this.messages = const <String>[],
    this.userChallengesIDs = const <String>[],
    this.firendsRequest = const <String>[],
  });
  final String id;
  final String userAuthID;
  final String userName;
  final String userEmail;
  final String? profileAvatar;
  final bool isAdmin;
  final bool isUser;
  final UserDetailsEntity? details;
  final List<String> friends;
  final UserPreferencesEntity? preferences;
  final List<String> messages;
  final List<String> userChallengesIDs;
  final List<String> firendsRequest;
  final UserActiveEntity active;
}
