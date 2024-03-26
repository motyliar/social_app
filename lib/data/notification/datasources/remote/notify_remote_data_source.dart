import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:flutter/widgets.dart';

abstract class INotifyRemoteDataSource {
  Future<void> addNewNotify(NotificationParams params);
}

class NotifyRemoteDataSourceImpl extends INotifyRemoteDataSource {
  @override
  Future<void> addNewNotify(NotificationParams params) async {
    try {
      final response = await HttpPostDataHandler(params: params).returnData();
      return response.fold((l) => throw l, (r) => r);
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(e.toString());
    }
  }
}
