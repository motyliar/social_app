import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';

class GetSingleNoticeUseCase extends UseCase<NoticeEntity, GetNoticeParams> {
  GetSingleNoticeUseCase({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;
  final NoticeRepository _noticeRepository;

  @override
  EitherFunc<NoticeEntity> execute(GetNoticeParams params) {
    return _noticeRepository.getSingleNotice(params);
  }
}
