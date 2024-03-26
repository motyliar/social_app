import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/error/exceptions/exception_handler.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/notification/models/notification_model.dart';
import 'package:flutter/widgets.dart';

abstract class INotifyRemoteDataSource {
  Future<void> addNewNotify(NotificationParams params);
  Future<List<NotificationModel>> fetchUserNotify(NotificationParams params);
}

class NotifyRemoteDataSourceImpl extends INotifyRemoteDataSource {
  @override
  Future<void> addNewNotify(NotificationParams params) async {
    try {
      final response = await HttpPostDataHandler(params: params).returnData();
      return response.fold((l) => throw l, (r) => r);
    } catch (e) {
      ExceptionHandler(e).execute();
    }
  }

  @override
  Future<List<NotificationModel>> fetchUserNotify(
      NotificationParams params) async {
    try {
      final response = await HttpGetDataHandler(params: params).returnData();
      final data = response.fold((l) => throw l, (r) => r as List<dynamic>);
      return data.map((e) => NotificationModel.fromJson(e)).toList();
    } catch (e) {
      throw ExceptionHandler(e).execute();
    }
  }
}
