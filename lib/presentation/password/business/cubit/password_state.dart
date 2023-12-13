part of 'password_cubit.dart';


sealed class PasswordState extends Equatable {

  const PasswordState();


  @override

  List<Object> get props => [];

}


final class PasswordInitial extends PasswordState {}


class PasswordSuccess extends PasswordState {}


class PasswordFailed extends PasswordState {

  const PasswordFailed({required this.exceptionMessage});


  final String exceptionMessage;


  @override

  List<Object> get props => [exceptionMessage];

}

