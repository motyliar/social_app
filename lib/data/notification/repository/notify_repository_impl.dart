import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/error/exceptions/exception_handler.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/notification/datasources/remote/notify_remote_data_source.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/domains/notification/repository/notify_repository.dart';
import 'package:dartz/dartz.dart';

class NotifyRepositoryImpl extends NotifyRepository {
  NotifyRepositoryImpl({required INotifyRemoteDataSource remote})
      : _remote = remote;
  final INotifyRemoteDataSource _remote;

  @override
  EitherFunc<void> sendNotify(NotificationParams params) async {
    try {
      return await Utils().performNetworkOperation(
        () async => await _remote.addNewNotify(params).then(
              (value) => Right(
                value,
              ),
            ),
      );
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException.message(e.toString()));
    }
  }

  @override
  EitherFunc<List<NotificationEntity>> fetchUserNotify(
      NotificationParams params) async {
    try {
      return await Utils().performNetworkOperation(
        () async => await _remote.fetchUserNotify(params).then(
              (value) => Right(
                value.map((e) => e.toEntity()).toList(),
              ),
            ),
      );
    } catch (e) {
      return Left(ExceptionHandler(e).execute());
    }
  }
}
