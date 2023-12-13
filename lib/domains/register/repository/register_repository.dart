import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Exception, RegisterEntites>> createDBUser(
    RegisterEntites newUser,
  );
  Future<Either<Exception, RegisterEntites>> createNewFirebaseUser(
    RegisterEntites newUser,
  );
}
