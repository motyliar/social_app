import 'dart:convert';

import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http.delete_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_put_data_hanlder.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/message/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const String _dataGetter = 'status';

abstract class MessageRemoteDataSources {
  EitherFunc<String> sendMessage(MessageRequestParams params);
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params);
  EitherFunc<String> deleteMessage(MessageDeleteParams delete);
  EitherFunc<String> updateMessage(MessageUpdateParams update);
}

class MessageRemoteDataSourcesImpl extends MessageRemoteDataSources {
  MessageRemoteDataSourcesImpl({required this.client});
  final http.Client client;

  @override
  EitherFunc<String> sendMessage(MessageRequestParams params) async {
    return HttpPostDataHandler(params: params)
        .returnData(dataGetter: _dataGetter);
  }

  @override
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params) async {
    final response = await client.post(
        Uri.parse(AppUrl.getUserMessages(params.userId)),
        body: jsonEncode(params.requestBody()),
        headers: AppUrl.contentHeaders);

    if (response.statusCode == 200) {
      final result =
          jsonDecode(response.body)[params.direction] as List<dynamic>;
      final data =
          result.map((message) => MessageModel.fromJson(message)).toList();
      return Right(data);
    } else if (response.statusCode == 204) {
      return const Right(<MessageModel>[]);
    } else if (response.statusCode == 404) {
      return Left(ServerException.notFound());
    } else {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<String> deleteMessage(MessageDeleteParams delete) async {
    return await HttpDeleteDataHandler(params: delete)
        .returnData(dataGetter: _dataGetter);
  }

  @override
  EitherFunc<String> updateMessage(MessageUpdateParams update) async {
    return await HttpPutDataHandler(params: update)
        .returnData(dataGetter: _dataGetter);
  }
}
