import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/data/password/datasources/password_remote_data_sources.dart';
import 'package:climbapp/data/password/models/password_model.dart';
import 'package:climbapp/domains/password/entities/password_entity.dart';
import 'package:climbapp/domains/password/repository/password_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordRepositoryImpl extends PasswordRepository {
  PasswordRepositoryImpl(this._passwordRemoteDataSources);
  final PasswordRemoteDataSources _passwordRemoteDataSources;

  @override
  Future<Either<Exception, String>> forgotPassword(
    String detailsPassword,
  ) async {
    if (await NetworkConnectedImpl().noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      try {
        final result =
            await _passwordRemoteDataSources.forgotPassword(detailsPassword);
        return Right(result);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseCodeExceptions(e.code));
      }
    }
  }

  @override
  Future<Either<Exception, String>> changePassword(
    PasswordEntity detailPassword,
  ) async {
    if (await NetworkConnectedImpl().noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      try {
        final result = await _passwordRemoteDataSources.changePassword(
          PasswordModel.toEntity(passwordEntity: detailPassword),
        );
        return Right(result);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseCodeExceptions(e.code));
      }
    }
  }
}
