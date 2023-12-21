part of 'friends_action_bloc.dart';

sealed class FriendsActionState extends Equatable {
  const FriendsActionState({this.friends = const <FriendsEntity>[]});
  final List<FriendsEntity> friends;

  @override
  List<Object> get props => [friends];
}

final class FriendsActionInitial extends FriendsActionState {
  const FriendsActionInitial({super.friends});
}

class FriendsLoading extends FriendsActionState {}

class FriendsLoaded extends FriendsActionState {
  const FriendsLoaded(List<FriendsEntity> friends) : super(friends: friends);
  @override
  List<Object> get props => [friends];
}

class FriendsFailure extends FriendsActionState {
  const FriendsFailure({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
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
