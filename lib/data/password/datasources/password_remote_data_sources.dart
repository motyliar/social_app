import 'package:climbapp/data/password/models/password_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class PasswordRemoteDataSources {
  Future<String> forgotPassword(String email);
  Future<String> changePassword(PasswordModel passwordDetail);
}

class PasswordRemoteDataSourcesImpl extends PasswordRemoteDataSources {
  @override
  Future<String> forgotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return 'success';
  }

  @override
  Future<String> changePassword(PasswordModel passwordDetail) async {
    final user = FirebaseAuth.instance.currentUser;

    AuthCredential credential = EmailAuthProvider.credential(
      email: passwordDetail.userEmail,
      password: passwordDetail.oldPassword,
    );

    await user!.reauthenticateWithCredential(credential);

    await user.updatePassword(passwordDetail.newPassword);

    return 'success';
  }
}
