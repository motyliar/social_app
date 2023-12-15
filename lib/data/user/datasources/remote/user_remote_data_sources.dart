import 'dart:convert';

import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/user/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSources {
  Future<Either<Exception, UserModel>> getUser(GetUserParams user);
  EitherFunc<UserModel> updateUser<T>(UpdateUserParams<T> update);
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
      Uri.parse(AppUrl.updateUser() + update.userId),
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
}
