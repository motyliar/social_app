import 'package:climbapp/domains/register/entites/register_entites.dart';

class RegisterModel extends RegisterEntites {
  const RegisterModel(
    String id,
    String userName,
    String userEmail,
    String password,
  ) : super(
          id: id,
          userName: userName,
          userEmail: userEmail,
          password: password,
        );

  @override
  List<Object> get props => [userName, userEmail, password];

  factory RegisterModel.toEntite(RegisterEntites user) {
    return RegisterModel(user.id, user.userName, user.userEmail, user.password);
  }
}
