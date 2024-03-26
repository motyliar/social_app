// ignore: unused_import
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';

abstract class NotifyRepository {
  EitherFunc<void> sendNotify(NotificationParams params);
  EitherFunc<List<NotificationEntity>> fetchUserNotify(
      NotificationParams params);
}
