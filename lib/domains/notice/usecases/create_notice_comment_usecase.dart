import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class CreateNoticeCommentUseCase extends IUseCase<NoticeRepository,
    ResponseStatus, CreateNoticeCommentsParams> {
  CreateNoticeCommentUseCase({required super.repository});

  @override
  EitherFunc<ResponseStatus> execute(CreateNoticeCommentsParams params) {
    return repository_.addCommentToNotice(params);
  }
}
