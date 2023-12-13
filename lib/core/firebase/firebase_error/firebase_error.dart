import 'package:climbapp/core/constans/constans.dart';

class FirebaseError {
  const FirebaseError(this.errorMessage);
  final String errorMessage;

  static const String invalidPassword = 'wrong-password';
  static const String invalidCredential = 'invalid-credential';
  static const String invalidEmail = 'invalid-email';
  static const String weakPassword = 'weak-password';
  static const String notAllowed = 'operation-not-allowed';
  static const String emailUsed = 'email-already-in-use';
  static const String userDisabled = 'user-disabled';
  static const String userNotFound = 'user-not-found';
  static const String channelError = 'channel-error';
  static const String disconnect = kDisconnect;
}
