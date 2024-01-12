import 'dart:convert';

import 'package:climbapp/core/datahelpers/handlers/response_handlers.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class ResponseHandler extends IResponseHandler {
  @override
  EitherFunc<T> checkStatusCodeAndReturnData<T>(Response response,
      {String? dataGetter}) async {
    print('STATUS CODE: ${response.statusCode}');
    if (response.statusCode == 200) {
      return Right(_convertResponseToData<T>(response, dataGetter: dataGetter));
    } else if (response.statusCode == 404) {
      return Left(ServerException.notFound());
    } else {
      return Left(ServerException.failed());
    }
  }

  T _convertResponseToData<T>(Response response, {String? dataGetter}) {
    if (dataGetter == null) {
      return jsonDecode(response.body) as T;
    }
    return jsonDecode(response.body)[dataGetter] as T;
  }
}
