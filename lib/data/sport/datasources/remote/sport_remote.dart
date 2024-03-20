import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/sport/models/sport_model.dart';
import 'package:flutter/material.dart';

const String _dataEndpoint = 'message';

abstract class ISportRemoteSource {
  Future<SportModel> getUserFavouriteSport(GetSportParams params);
  Future<String> updateUserSports(UpdateSportParams params);
}

class SportRemoteSourceImpl extends ISportRemoteSource {
  @override
  Future<SportModel> getUserFavouriteSport(GetSportParams params) async {
    try {
      final response = await HttpGetDataHandler(params: params).returnData();

      return response.fold((l) => throw ServerException.error(),
          (sports) => SportModel.fromJson(sports));
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    }
  }

  @override
  Future<String> updateUserSports(UpdateSportParams params) async {
    try {
      final response = await HttpPostDataHandler(params: params).returnData();
      return response.fold(
          (l) => throw ServerException.error(), (r) => r[_dataEndpoint]);
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    }
  }
}
