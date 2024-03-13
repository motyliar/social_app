import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/sport/datasources/remote/sport_remote.dart';
import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:climbapp/domains/sports/repository/sports_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SportRepositoryImpl extends SportsRepository {
  SportRepositoryImpl({required ISportRemoteSource remote}) : _remote = remote;
  final ISportRemoteSource _remote;

  @override
  EitherFunc<SportEntity> getUserFavouriteSports(GetSportParams params) async {
    try {
      return await Utils().performNetworkOperation(() async => await _remote
          .getUserFavouriteSport(params)
          .then((sports) => Right(sports.toEntity())));
    } on ServerException catch (e) {
      return Left(ServerException(e.message));
    }
  }

  @override
  EitherFunc<String> updateUserSports(UpdateSportParams params) async {
    try {
      return await Utils().performNetworkOperation(() async =>
          await _remote.updateUserSports(params).then((value) => Right(value)));
    } on ServerException catch (e) {
      debugPrint(e.message);
      return Left(ServerException(e.message));
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerException(e.toString()));
    }
  }
}
