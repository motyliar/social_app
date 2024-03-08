part of 'user_bloc.dart';

const defaultUser = UserEntity(
    id: '',
    userAuthID: '',
    userName: '',
    userEmail: '',
    active: UserActiveEntity(isActive: false, lastLoggedIn: ''));

class UserState extends Equatable {
  final UserEntity user;
  const UserState({this.user = defaultUser});

  @override
  List<Object?> get props => [user];
}

final class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  const UserLoaded({
    required super.user,
    this.params,
  });

  final GetUserParams? params;

  UserLoaded copyWith(
    UserEntity? user,
    GetUserParams? params,
  ) {
    return UserLoaded(
      user: user ?? this.user,
      params: params ?? this.params,
    );
  }

  @override
  List<Object?> get props => [
        user,
        params,
      ];
}

class LoadingFailed extends UserState {}

class ServerFailed extends UserState {}
