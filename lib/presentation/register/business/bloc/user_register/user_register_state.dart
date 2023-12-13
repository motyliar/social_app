part of 'user_register_bloc.dart';


sealed class UserRegisterState extends Equatable {

  const UserRegisterState();


  @override

  List<Object?> get props => [];

}


final class UserRegisterInitial extends UserRegisterState {}


class UserRegisterLoaded extends UserRegisterState {

  const UserRegisterLoaded({required this.user});


  final RegisterEntites user;


  @override

  List<Object?> get props => [user];

}


class UserRegisterFailure extends UserRegisterState {

  const UserRegisterFailure({required this.exceptionMessage});


  final String exceptionMessage;


  @override

  List<Object?> get props => [exceptionMessage];

}


class ServerFailure extends UserRegisterState {}

