import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';

class CreateNewNotice extends UseCase<ResponseStatus, CreateNoticeParams> {
  CreateNewNotice({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;
  final NoticeRepository _noticeRepository;

  @override
  EitherFunc<ResponseStatus> execute(CreateNoticeParams params) {
    return _noticeRepository.createNewNotice(params);
  }
}
