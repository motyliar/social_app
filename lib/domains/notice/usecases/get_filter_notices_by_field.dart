import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class GetFilterNoticesByFieldUseCase
    extends IUseCase<NoticeRepository, List<NoticeEntity>, GetNoticeParams> {
  GetFilterNoticesByFieldUseCase({required super.repository});

  @override
  EitherFunc<List<NoticeEntity>> execute(GetNoticeParams params) {
    return repository_.getFilterNoticesByField(params);
  }
}
