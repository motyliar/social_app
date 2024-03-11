import 'dart:convert';

import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/user/user_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_put_data_hanlder.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/user/models/user_model.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSources {
  Future<Either<Exception, UserModel>> getUser(GetUserParams user);
  EitherFunc<UserModel> updateUser<T>(UpdateUserParams<T> update);
  Future<UserModel> updating(UpdatingUserParams params);
}

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  UserRemoteDataSourcesImpl({required this.client});
  final http.Client client;
  @override
  Future<Either<Exception, UserModel>> getUser(GetUserParams user) async {
    final response = await client.get(
      Uri.parse(AppUrl.userApi() + user.userId),
      headers: AppUrl.tokenHeaders(user.token),
    );

    if (response.statusCode == 200) {
      return Right(
        UserModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    } else if (response.statusCode == 404) {
      return Left(ServerException.errorMessage(responseBody: response.body));
    } else {
      return Left(ServerException.error());
    }
  }

  @override
  EitherFunc<UserModel> updateUser<T>(UpdateUserParams<T> update) async {
    final response = await client.put(
      AppUrl.updateUser(update.userId),
      body: jsonEncode(update.toUpdate),
      headers: AppUrl.tokenHeaders(update.token),
    );
    if (response.statusCode == 201) {
      return Right(
        UserModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    } else if (response.statusCode == 404) {
      return Left(ServerException.errorMessage(responseBody: response.body));
    } else {
      return Left(ServerException.error());
    }
  }

  @override
  Future<UserModel> updating(UpdatingUserParams params) async {
    try {
      final response = await HttpPutDataHandler(params: params).returnData();
      return response.fold((l) {
        debugPrint(l.toString());
        throw ServerException('Response problem');
      }, (r) => UserModel.fromJson(r));
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException.error();
    }
  }
}
