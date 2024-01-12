import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class FindNoticesCreatedByUserUseCase
    extends IUseCase<NoticeRepository, List<NoticeEntity>, GetNoticeParams> {
  FindNoticesCreatedByUserUseCase({required super.repository});

  @override
  EitherFunc<List<NoticeEntity>> execute(GetNoticeParams params) {
    return repository_.findNoticesCreatedByUser(params);
  }
}
