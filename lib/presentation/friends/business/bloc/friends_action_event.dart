part of 'friends_action_bloc.dart';

sealed class FriendsActionEvent extends Equatable {
  const FriendsActionEvent();

  @override
  List<Object> get props => [];
}

class FetchFriendsListEvent extends FriendsActionEvent {
  const FetchFriendsListEvent({required this.params});
  final GetFriendsParams params;
  @override
  List<Object> get props => [params];
}

class DeleteFriendFromListEvent extends FriendsActionEvent {
  const DeleteFriendFromListEvent({required this.params});
  final GetFriendsParams params;
  @override
  List<Object> get props => [params];
}

class AddFriendEvent extends FriendsActionEvent {
  const AddFriendEvent({required this.params});
  final GetFriendsParams params;
  @override
  List<Object> get props => [params];
}

class SearchForUsersEvent extends FriendsActionEvent {
  const SearchForUsersEvent({required this.userByName});
  final String userByName;
  @override
  List<Object> get props => [userByName];
}

class ChangeStateViewEvent extends FriendsActionEvent {}
