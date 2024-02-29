part of 'add_to_friend_cubit.dart';

enum FriendStatus { delete, add, clear }

class AddToFriendState extends Equatable {
  const AddToFriendState({this.status = FriendStatus.clear});
  final FriendStatus status;
  @override
  List<Object> get props => [status];
}

final class AddToFriendInitial extends AddToFriendState {}

class AddToFriendSuccess extends AddToFriendState {}

class AddToFriendFailed extends AddToFriendState {}
