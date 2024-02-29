// ignore: unused_import
import 'package:climbapp/core/datahelpers/params/auth/logout.dart';
import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  Future<Either<Exception, String>> loginAction(SignInEntity user);
  Future<void> logOut(LogOutParams params);
  Future<Either<Exception, SignInEntity>> catchUserToken(SignInEntity user);
}
