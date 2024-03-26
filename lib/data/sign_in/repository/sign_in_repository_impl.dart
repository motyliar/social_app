import 'package:climbapp/core/datahelpers/params/auth/logout.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/sign_in/datasources/sign_in_remote_data.dart';
import 'package:climbapp/data/sign_in/models/sign_in_model.dart';
import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/domains/sign_in/repository/sign_in_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class SignInRepositoryImpl extends SignInRepository {
  SignInRepositoryImpl(this._signInRemoteDataSources);
  final SignInRemoteDataSources _signInRemoteDataSources;

  @override
  Future<Either<Exception, String>> loginAction(SignInEntity user) async {
    if (await NetworkConnectedImpl().noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      final serverConnection =
          await Utils().checkServerAvailable(client: http.Client());
      if (serverConnection.isRight() == true) {
        try {
          final result = await _signInRemoteDataSources
              .loginAction(SignInModel.toModel(user));
          return Right(result);
        } on FirebaseAuthException catch (exception) {
          return Left(FirebaseCodeExceptions(exception.code));
        }
      } else {
        return Left(ServerException.failed());
      }
    }
  }

  @override
  Future<void> logOut(LogOutParams params) async {
    try {
      await _signInRemoteDataSources.logOut(params);
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw ServerException.error();
    }
  }

  @override
  Future<Either<Exception, SignInEntity>> catchUserToken(
    SignInEntity user,
  ) async {
    if (await NetworkConnectedImpl().noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      try {
        final serverResponse = await _signInRemoteDataSources
            .catchUserToken(SignInModel.toModel(user));

        return serverResponse.fold(
          (exception) => Left(exception),
          (signModel) => Right(
            signModel.toEntity(),
          ),
        );
      } on Exception catch (e) {
        return Left(Exception(e));
      }
    }
  }
}
