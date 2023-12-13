import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  const SignInEntity({
    required this.email,
    required this.password,
    this.token = '',
    this.userID = '',
  });
  final String email;
  final String password;
  final String token;
  final String userID;
  @override
  List<Object> get props => [email, password, token, userID];
}
