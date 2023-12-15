part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class LoadUserEvent extends UserEvent {
  const LoadUserEvent({required this.user});

  final GetUserParams user;

  @override
  List<Object> get props => [user];
}

class UpdateUserEvent extends UserEvent {
  const UpdateUserEvent({this.stringUpdate, this.boolUpdate, this.intUpdate});
  final UpdateUserParams<String>? stringUpdate;
  final UpdateUserParams<bool>? boolUpdate;
  final UpdateUserParams<int>? intUpdate;
  @override
  List<Object?> get props => [stringUpdate, boolUpdate, intUpdate];
}
