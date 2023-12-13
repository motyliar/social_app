import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/register/datasources/register_remote_data.dart';
import 'package:climbapp/data/register/models/register_model.dart';
import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:climbapp/domains/register/repository/register_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class RegisterRepositoryImpl extends RegisterRepository {
  RegisterRepositoryImpl(this._registerRemoteDataSources);
  final RegisterRemoteDataSources _registerRemoteDataSources;

  @override
  Future<Either<Exception, RegisterEntites>> createDBUser(
    RegisterEntites newUser,
  ) async {
    final networkConnection = await Connectivity().checkConnectivity();
    if (networkConnection == ConnectivityResult.none) {
      throw NetworkException('disconnected');
    } else {
      try {
        final result = await _registerRemoteDataSources
            .createDBUser(RegisterModel.toEntite(newUser));
        return Right(result);
      } on Exception catch (e) {
        return Left(NetworkException(e.toString()));
      }
    }
  }

  @override
  Future<Either<Exception, RegisterEntites>> createNewFirebaseUser(
    RegisterEntites newUser,
  ) async {
    final networkConnection = await Connectivity().checkConnectivity();
    if (networkConnection == ConnectivityResult.none) {
      return Left(NetworkException('disconnected'));
    } else {
      final serverConnection =
          await Utils().checkServerAvailable(client: http.Client());
      if (serverConnection.isRight() == true) {
        try {
          final result = await _registerRemoteDataSources
              .createNewFireBaseUser(RegisterModel.toEntite(newUser));
          return Right(result);
        } on Exception catch (e) {
          return Left(NetworkException(e.toString()));
        }
      } else {
        return Left(ServerException.failed());
      }
    }
  }
}
