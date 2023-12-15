part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  const UserLoaded({required this.user, this.params});

  final UserEntity user;
  final GetUserParams? params;

  UserLoaded copyWith(UserEntity? user, GetUserParams? params) {
    return UserLoaded(user: user ?? this.user, params: params ?? this.params);
  }

  @override
  List<Object?> get props => [user, params];
}

class LoadingFailed extends UserState {}

class ServerFailed extends UserState {}
