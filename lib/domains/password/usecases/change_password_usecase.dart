import 'package:climbapp/domains/password/entities/password_entity.dart';
import 'package:climbapp/domains/password/repository/password_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  const ChangePasswordUseCase(this._passwordRepository);
  final PasswordRepository _passwordRepository;

  Future<Either<Exception, String>> call(PasswordEntity detailsPassword) {
    return _passwordRepository.changePassword(detailsPassword);
  }
}
