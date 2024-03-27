import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/notification/repository/notify_repository.dart';

class DeleteNotifyUseCase
    extends IUseCase<NotifyRepository, void, NotificationParams> {
  DeleteNotifyUseCase({required super.repository});

  @override
  EitherFunc<void> execute(NotificationParams params) {
    return repository_.deleteNotify(params);
  }
}
