import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class UpdateCommentUseCase
    extends IUseCase<NoticeRepository, ResponseStatus, UpdateCommentParams> {
  UpdateCommentUseCase({required super.repository});

  @override
  EitherFunc<ResponseStatus> execute(UpdateCommentParams params) {
    return repository_.updateSingleComment(params);
  }
}
