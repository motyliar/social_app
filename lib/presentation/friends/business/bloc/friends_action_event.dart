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
