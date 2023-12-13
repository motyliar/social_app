import 'package:climbapp/domains/password/entities/password_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PasswordRepository {
  Future<Either<Exception, String>> forgotPassword(
    String detailsPassword,
  );
  Future<Either<Exception, String>> changePassword(
      PasswordEntity detailPassword,);
}
