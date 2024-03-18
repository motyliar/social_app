import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';

class UpdateUserIdJoinArraysUseCase
    extends IUseCase<NoticeRepository, void, UpdateRequestJoinParams> {
  UpdateUserIdJoinArraysUseCase({required super.repository});

  @override
  EitherFunc<void> execute(UpdateRequestJoinParams params) {
    return repository_.updateUserIdToJoin(params);
  }
}
