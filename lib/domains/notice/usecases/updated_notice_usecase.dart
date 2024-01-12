import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class UpdatedNoticeUseCase
    extends IUseCase<NoticeRepository, ResponseStatus, UpdateNoticeParams> {
  UpdatedNoticeUseCase({required super.repository});

  @override
  EitherFunc<ResponseStatus> execute(UpdateNoticeParams params) {
    return repository_.updateSingleNotice(params);
  }
}
