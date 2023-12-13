import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/domains/sign_in/repository/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

class CatchUserTokenUsecase {
  const CatchUserTokenUsecase({required SignInRepository signInRepository})
      : _signInRepository = signInRepository;
  final SignInRepository _signInRepository;

  Future<Either<Exception, SignInEntity>> call(SignInEntity user) {
    return _signInRepository.catchUserToken(user);
  }
}
