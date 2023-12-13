part of 'sign_in_bloc.dart';


sealed class SignInState extends Equatable {

  const SignInState();


  @override

  List<Object> get props => [];

}


final class SignInInitial extends SignInState {}


class SignInSuccess extends SignInState {

  const SignInSuccess({required this.user});


  final String user;


  @override

  List<Object> get props => [user];

}


class SignInFailed extends SignInState {

  const SignInFailed({required this.exceptionMessage});


  final String exceptionMessage;


  @override

  List<Object> get props => [exceptionMessage];

}


class SignInToMongoDB extends SignInState {

  const SignInToMongoDB({required this.userParams});


  final GetUserParams userParams;
  @override
  List<Object> get props => [userParams];

}


class LogOutState extends SignInState {}

