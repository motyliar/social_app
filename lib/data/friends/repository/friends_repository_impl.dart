import 'package:climbapp/core/error/exceptions/exception_handler.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/friends/datasources/locale/friends_locale_data_sources.dart';
import 'package:climbapp/data/friends/datasources/remote/friends_remote_data_sources.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dartz/dartz.dart';

class FriendsRepositoryImpl extends FriendsRepository {
  FriendsRepositoryImpl(
      {required FriendsRemoteDataSources friendsRemoteDataSources,
      required FriendsLocaleDataSource friendsLocaleDataSource})
      : _friendsRemoteDataSources = friendsRemoteDataSources,
        _friendsLocalDataSource = friendsLocaleDataSource;
  final FriendsRemoteDataSources _friendsRemoteDataSources;
  final FriendsLocaleDataSource _friendsLocalDataSource;
  @override
  EitherFunc<List<FriendsEntity>> getFriends(GetFriendsParams friends) async {
    if (await NetworkConnectedImpl(connectivity: Connectivity()).noConnection) {
      return await _friendsLocalDataSource.getFriendsFromHive().then(
          (response) => response.fold(
              (failure) => Left(failure),
              (data) =>
                  Right(data.map((friends) => friends.toEntity()).toList())));
    } else {
      final serverConnection = await Utils().getServerConnection();

      if (serverConnection.isRight()) {
        try {
          return await _friendsRemoteDataSources.getFriends(friends).then(
                (response) => response.fold(
                  (failure) {
                    return Left(failure);
                  },
                  (friends) async {
                    await _friendsLocalDataSource.addFriendsToHive(friends);
                    return Right(
                      friends.map((element) => element.toEntity()).toList(),
                    );
                  },
                ),
              );
        } catch (error) {
          return Left(ExceptionHandler(error).execute());
        }
      }
      return Left(ServerException.error());
    }
  }

  @override
  EitherFunc<String> deleteFriend(GetFriendsParams friend) async {
    if (await NetworkConnectedImpl(connectivity: Connectivity()).noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      final serverConnection = await Utils().getServerConnection();
      if (serverConnection.isRight()) {
        try {
          return await _friendsRemoteDataSources.deleteFriend(friend).then(
              (response) =>
                  response.fold((failure) => Left(failure), (data) async {
                    await _friendsLocalDataSource
                        .deleteFriendFromHive(friend.userId);
                    return Right(data);
                  }));
        } catch (error) {
          return Left(ServerException.error());
        }
      } else {
        return Left(ServerException.error());
      }
    }
  }

  @override
  EitherFunc<String> addFriend(GetFriendsParams friend) async {
    if (await NetworkConnectedImpl(connectivity: Connectivity()).noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      final serverConnection = await Utils().getServerConnection();
      if (serverConnection.isRight()) {
        try {
          return await _friendsRemoteDataSources.addFriend(friend).then(
              (response) => response.fold(
                  (failure) => Left(failure), (data) => Right(data)));
        } catch (error) {
          return Left(ServerException.error());
        }
      } else {
        return Left(ServerException.error());
      }
    }
  }

  @override
  EitherFunc<List<FriendsEntity>> searchUsers(String userByName) async {
    if (await NetworkConnectedImpl(connectivity: Connectivity()).noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      final serverConnection = await Utils().getServerConnection();
      if (serverConnection.isRight()) {
        try {
          return await _friendsRemoteDataSources
              .searchUsers(userByName)
              .then((response) => response.fold((failure) {
                    print(failure);
                    return Left(failure);
                  }, (data) {
                    print(data);
                    return Right(
                        data.map((friend) => friend.toEntity()).toList());
                  }));
        } catch (error) {
          return Left(ServerException(error.toString()));
        }
      } else {
        return Left(ServerException.errorMessage(responseBody: 'else-error'));
      }
    }
  }
}
