// ignore: unused_import
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/utils/utils.dart';

abstract class NotifyRepository {
  EitherFunc<void> sendNotify(NotificationParams params);
}
