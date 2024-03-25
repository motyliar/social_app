import 'package:climbapp/core/datahelpers/params/requests/requests_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/requests/models/requests_model.dart';
import 'package:flutter/material.dart';

abstract class IRequestDataSource {
  Future<List<RequestsModel>> getRequestedUsers(RequestsParams params);
}

class RequestsDataSourceImpl extends IRequestDataSource {
  @override
  Future<List<RequestsModel>> getRequestedUsers(RequestsParams params) async {
    try {
      final result = await HttpPostDataHandler(params: params).returnData();
      final dynamicList =
          result.fold((l) => throw l, (r) => r as List<dynamic>);
      return dynamicList.map((e) => RequestsModel.fromJson(e)).toList();
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException.error();
    } catch (e) {
      throw ServerException.message(e.toString());
    }
  }
}
