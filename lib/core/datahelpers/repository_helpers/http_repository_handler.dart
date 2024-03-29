import 'package:climbapp/core/datahelpers/handlers/response_handlers.impl.dart';
import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

abstract class HttpRepositoryHandler {
  const HttpRepositoryHandler({required this.params});
  final RepositoryParams params;

  Future<Response> getResponseFromServer();

  Future<Response> sendRequest() async {
    return await getResponseFromServer();
  }

  EitherFunc<T> returnData<T>({String? dataGetter}) async {
    try {
      final response = await sendRequest();
      debugPrint(response.statusCode.toString());

      return _handleResponse<T>(response, dataGetter: dataGetter);
    } catch (e) {
      throw ServerException('return-data');
    }
  }

  EitherFunc<T> _handleResponse<T>(Response response,
      {String? dataGetter}) async {
    final handler = ResponseHandler();
    return handler.checkStatusCodeAndReturnData<T>(response,
        dataGetter: dataGetter);
  }
}
