import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  const SignInModel(String email, String password, String token, String userID)
      : super(email: email, password: password, token: token, userID: userID);

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      json['userEmail'] as String,
      json['userAuthID'] as String,
      json['token'] as String,
      json['id'] as String,
    );
  }

  @override
  List<Object> get props => [email, password, token, userID];

  // ignore: sort_constructors_first
  factory SignInModel.toModel(SignInEntity user) {
    return SignInModel(user.email, user.password, user.token, user.userID);
  }

  SignInEntity toEntity() => SignInEntity(
        email: email,
        password: password,
        token: token,
        userID: userID,
      );
}
