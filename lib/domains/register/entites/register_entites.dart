import 'package:equatable/equatable.dart';

class RegisterEntites extends Equatable {
  const RegisterEntites({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.password,
  });
  final String id;
  final String userName;
  final String userEmail;
  final String password;
  @override
  List<Object> get props => [id, userName, userEmail, password];
}
