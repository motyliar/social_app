import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/friends/datasources/locale/friends_locale_data_sources.dart';
import 'package:climbapp/data/friends/datasources/remote/friends_remote_data_sources.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';
import 'package:climbapp/presentation/app/business/bloc/network/network_bloc.dart';
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
    if (await NetworkConnectedImpl().noConnection) {
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
                  Left.new,
                  (friends) async {
                    _friendsLocalDataSource.addFriendsToHive(friends);
                    return Right(
                      friends.map((element) => element.toEntity()).toList(),
                    );
                  },
                ),
              );
        } catch (error) {
          return Left(ServerException.error());
        }
      }
      return Left(ServerException.error());
    }
  }
}
