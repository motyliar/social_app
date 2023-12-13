// ignore: unused_import
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Exception, UserEntity>> getUser(GetUserParams user);
}
