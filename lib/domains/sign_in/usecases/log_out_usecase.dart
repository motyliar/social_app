import 'package:climbapp/domains/sign_in/repository/sign_in_repository.dart';

class LogOutUseCase {
  const LogOutUseCase(this._signInRepository);
  final SignInRepository _signInRepository;

  Future<void> call() {
    return _signInRepository.logOut();
  }
}
