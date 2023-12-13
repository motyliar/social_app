import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:climbapp/domains/register/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class CreateNewFirebaseUserUsecase {
  const CreateNewFirebaseUserUsecase(this._registerRepository);
  final RegisterRepository _registerRepository;

  Future<Either<Exception, RegisterEntites>> execute(RegisterEntites newUser) {
    return _registerRepository.createNewFirebaseUser(newUser);
  }
}
