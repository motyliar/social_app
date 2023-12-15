import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/network/network_connected.dart';

import 'package:climbapp/core/utils/helpers/helpers.dart';

import 'package:climbapp/data/user/datasources/local/user_local_data_sources.dart';
import 'package:climbapp/data/user/datasources/remote/user_remote_data_sources.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required UserLocalDataSources userLocalDataSources,
    required UserRemoteDataSources userRemoteDataSources,
  })  : _userLocalDataSources = userLocalDataSources,
        _userRemoteDataSources = userRemoteDataSources;
  final UserLocalDataSources _userLocalDataSources;
  final UserRemoteDataSources _userRemoteDataSources;

  @override
  EitherFunc<UserEntity> getUser(GetUserParams user) async {
    if (await NetworkConnectedImpl().noConnection) {
      return _userLocalDataSources.getUserFromHive().then(
            (response) => response.fold(
              (failure) => Left(HiveExceptions.emptyData()),
              (data) => Right(data.toEntity()),
            ),
          );
    } else {
      final serverConnection = await Utils().getServerConnection();
      if (serverConnection.isRight()) {
        try {
          return await _userRemoteDataSources.getUser(user).then(
                (response) => response.fold(Left.new, (userModel) async {
                  print(response);
                  await _userLocalDataSources.updateHiveUser(userModel);
                  return Right(
                    userModel.toEntity(),
                  );
                }),
              );
        } on Exception catch (e) {
          return Left(Exception(e.toString()));
        }
      }
    }
    return Left(ServerException(kSomethingGoesWrong));
  }

  @override
  EitherFunc<UserEntity> updateUser<T>(UpdateUserParams<T> update) async {
    if (await NetworkConnectedImpl().noConnection) {
      return _userLocalDataSources.getUserFromHive().then(
            (response) => response.fold(
              (failure) => Left(HiveExceptions.emptyData()),
              (data) => Right(data.toEntity()),
            ),
          );
    } else {
      final serverConnection = await Utils().getServerConnection();
      if (serverConnection.isRight()) {
        try {
          return await _userRemoteDataSources.updateUser(update).then(
                (response) => response.fold(Left.new, (userModel) async {
                  await _userLocalDataSources.updateHiveUser(userModel);
                  return Right(userModel.toEntity());
                }),
              );
        } on Exception catch (e) {
          return Left(Exception(e.toString()));
        }
      }
      return Left(ServerException(kSomethingGoesWrong));
    }
  }
}
