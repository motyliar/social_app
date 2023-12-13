import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:climbapp/domains/register/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class CreateDBUserUsecase {
  const CreateDBUserUsecase(this._registerRepository);
  final RegisterRepository _registerRepository;

  Future<Either<Exception, RegisterEntites>> execute(
    RegisterEntites newUser,
  ) {
    return _registerRepository.createDBUser(newUser);
  }
}
