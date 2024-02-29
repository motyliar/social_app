part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInProcess extends SignInEvent {
  const SignInProcess({required this.user});

  final SignInEntity user;

  @override
  List<Object> get props => [user];
}

class LogOutEvent extends SignInEvent {
  const LogOutEvent({required this.params});
  final LogOutParams params;
  @override
  List<Object> get props => [params];
}

class CatchUserTokenFromMongoDB extends SignInEvent {
  const CatchUserTokenFromMongoDB({required this.user});

  final SignInEntity user;

  @override
  List<Object> get props => [user];
}

class SignInInitLoadingEvent extends SignInEvent {}
