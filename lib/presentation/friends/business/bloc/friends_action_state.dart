part of 'friends_action_bloc.dart';

sealed class FriendsActionState extends Equatable {
  const FriendsActionState(
      {this.friends = const <FriendsEntity>[], this.isMyFriend = true});
  final List<FriendsEntity> friends;
  final bool isMyFriend;

  @override
  List<Object> get props => [friends, isMyFriend];
}

final class FriendsActionInitial extends FriendsActionState {
  const FriendsActionInitial({super.friends});
}

class FriendsLoading extends FriendsActionState {}

class FriendsLoaded extends FriendsActionState {
  const FriendsLoaded(List<FriendsEntity> friends, bool isMyFriend)
      : super(friends: friends, isMyFriend: isMyFriend);

  FriendsLoaded copyWith(List<FriendsEntity>? friends, bool? isMyFriend) {
    return FriendsLoaded(
        friends ?? this.friends, isMyFriend ?? this.isMyFriend);
  }

  @override
  List<Object> get props => [
        friends,
        isMyFriend,
      ];
}

class FriendsFailure extends FriendsActionState {
  const FriendsFailure({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}

class FriendsSearchingSuccess extends FriendsActionState {
  const FriendsSearchingSuccess(
    bool isMyFriend,
    List<FriendsEntity> friends, {
    required this.friend,
  }) : super(isMyFriend: isMyFriend, friends: friends);
  final List<FriendsEntity> friend;
  @override
  List<Object> get props => [friend, isMyFriend, friends];
}

class FriendChangeSuccess extends FriendsActionState {
  const FriendChangeSuccess({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}

class FriendOperationFailure extends FriendsActionState {
  const FriendOperationFailure({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
