part of 'user_bloc.dart';


sealed class UserState extends Equatable {

  const UserState();


  @override

  List<Object> get props => [];

}


final class UserInitial extends UserState {}


class UserLoading extends UserState {}


class UserLoaded extends UserState {

  const UserLoaded({required this.user, this.params});


  final UserEntity user;


  final GetUserParams? params;


  @override

  List<Object> get props => [user];

}


class LoadingFailed extends UserState {}


class ServerFailed extends UserState {}

