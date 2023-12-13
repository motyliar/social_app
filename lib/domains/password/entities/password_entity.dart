import 'package:equatable/equatable.dart';

class PasswordEntity extends Equatable {
  const PasswordEntity(
      {required this.oldPassword,
      required this.newPassword,
      required this.userEmail});
  final String oldPassword;
  final String newPassword;
  final String userEmail;

  @override
  List<Object> get props => [oldPassword, newPassword, userEmail];

  @override
  String toString() =>
      'oldPassword: $oldPassword newPassword: $newPassword userEmail: $userEmail';
}
