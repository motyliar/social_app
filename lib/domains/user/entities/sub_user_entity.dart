import 'package:equatable/equatable.dart';

class UserDetailsEntity extends Equatable {
  const UserDetailsEntity({this.age, this.gender, this.phone});
  final int? age;
  final String? gender;
  final String? phone;

  @override
  List<Object?> get props => [age, gender, phone];
}

class UserFriendsEntity extends Equatable {
  const UserFriendsEntity({
    required this.userID,
    required this.userName,
    required this.userAvatar,
  });
  final String userID;
  final String userAvatar;
  final String userName;

  @override
  List<Object> get props => [userID, userName, userAvatar];
}

class UserPreferencesEntity extends Equatable {
  const UserPreferencesEntity({this.mode = true, this.language = 'pl'});
  final bool mode;
  final String language;
  @override
  List<Object> get props => [mode, language];
}
