import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class DeleteSingleCommentUseCase
    extends IUseCase<NoticeRepository, ResponseStatus, GetNoticeParams> {
  DeleteSingleCommentUseCase({required super.repository});
  @override
  EitherFunc<ResponseStatus> execute(GetNoticeParams params) {
    return repository_.deleteSingleComment(params);
  }
}
