import 'dart:convert';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/friends/models/friends_model.dart';
import 'package:http/http.dart' as http;

abstract class FriendsRemoteDataSources {
  EitherFunc<List<FriendsModel>> getFriends(GetFriendsParams friends);
}

class FriendsRemoteDataSourcesImpl extends FriendsRemoteDataSources {
  FriendsRemoteDataSourcesImpl({required this.client});
  final http.Client client;

  @override
  EitherFunc<List<FriendsModel>> getFriends(GetFriendsParams friends) async {
    final response = await client.get(
        Uri.parse(AppUrl.getFriends(friends.userId)),
        headers: AppUrl.contentHeaders);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as List<dynamic>;

      final friends =
          result.map((element) => FriendsModel.fromJson(element)).toList();

      return Right(friends);
    } else if (response.statusCode == 404) {
      return Left(ServerException.errorMessage(responseBody: response.body));
    } else {
      return Left(ServerException.failed());
    }
  }
}
