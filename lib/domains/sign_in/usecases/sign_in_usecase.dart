import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/domains/sign_in/repository/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  const SignInUseCase(this._signInRepository);
  final SignInRepository _signInRepository;
  Future<Either<Exception, String>> execute(SignInEntity user) {
    return _signInRepository.loginAction(user);
  }
}
