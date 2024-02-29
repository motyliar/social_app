import 'package:climbapp/core/datahelpers/params/auth/logout.dart';
import 'package:climbapp/domains/sign_in/repository/sign_in_repository.dart';

class LogOutUseCase {
  const LogOutUseCase(this._signInRepository);
  final SignInRepository _signInRepository;

  Future<void> execute(LogOutParams params) {
    return _signInRepository.logOut(params);
  }
}
