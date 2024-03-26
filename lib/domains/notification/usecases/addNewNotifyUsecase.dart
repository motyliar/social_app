import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/notification/repository/notify_repository.dart';

class AddNewNotifyUseCase
    extends IUseCase<NotifyRepository, void, NotificationParams> {
  AddNewNotifyUseCase({required super.repository});

  @override
  EitherFunc<void> execute(NotificationParams params) {
    return repository_.sendNotify(params);
  }
}
