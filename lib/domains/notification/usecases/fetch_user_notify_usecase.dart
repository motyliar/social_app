import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/domains/notification/repository/notify_repository.dart';

class FetchUserNotifyUseCase extends IUseCase<NotifyRepository,
    List<NotificationEntity>, NotificationParams> {
  FetchUserNotifyUseCase({required super.repository});

  @override
  EitherFunc<List<NotificationEntity>> execute(NotificationParams params) {
    return repository_.fetchUserNotify(params);
  }
}
