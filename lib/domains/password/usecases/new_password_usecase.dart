import 'package:climbapp/domains/password/repository/password_repository.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase {
  const ForgotPasswordUseCase(this._passwordRepository);
  final PasswordRepository _passwordRepository;

  Future<Either<Exception, String>> call(String passwordDetail) {
    return _passwordRepository.forgotPassword(passwordDetail);
  }
}
