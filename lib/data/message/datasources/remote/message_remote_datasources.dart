import 'dart:convert';

import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/message/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class MessageRemoteDataSources {
  EitherFunc<String> sendMessage(MessageParams message);
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params);
  EitherFunc<String> deleteMessage(GetMessageParams delete);
  EitherFunc<String> updateMessage(GetMessageParams update);
}

class MessageRemoteDataSourcesImpl extends MessageRemoteDataSources {
  MessageRemoteDataSourcesImpl({required this.client});
  final http.Client client;

  @override
  EitherFunc<String> sendMessage(MessageParams message) async {
    final response = await client.post(Uri.parse(AppUrl.sendMessageUrl()),
        body: jsonEncode(AppUrl.messageMap(message)),
        headers: AppUrl.contentHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body)['message'] as String);
    } else if (response.statusCode == 404) {
      return Left(ServerException.errorMessage(responseBody: response.body));
    } else {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params) async {
    final response = await client.post(
        Uri.parse(AppUrl.getUserMessages(params.userId)),
        body: jsonEncode(params.requestBody()),
        headers: AppUrl.contentHeaders);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as List<dynamic>;
      final data =
          result.map((message) => MessageModel.fromJson(message)).toList();
      return Right(data);
    } else if (response.statusCode == 204) {
      return Right(const <MessageModel>[]);
    } else if (response.statusCode == 404) {
      return Left(ServerException.notFound());
    } else {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<String> deleteMessage(GetMessageParams delete) async {
    final response = await client.delete(
      Uri.parse(AppUrl.deleteMessage(delete.userId)),
      body: jsonEncode(
        delete.deleteRequestBody(),
      ),
      headers: AppUrl.contentHeaders,
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['message'] as String;
      return Right(result);
    } else {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<String> updateMessage(GetMessageParams update) async {
    final response = await client.put(
        Uri.parse(AppUrl.updateMessage(update.userId)),
        body: jsonEncode(update.updateRequestBody()),
        headers: AppUrl.contentHeaders);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['message'] as String;
      return Right(result);
    } else if (response.statusCode == 404) {
      return Left(ServerException.notFound());
    } else {
      return Left(ServerException.failed());
    }
  }
}
