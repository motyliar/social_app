import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/usecases/updated_notice_usecase.dart';
import 'package:equatable/equatable.dart';

part 'update_notice_state.dart';

class UpdateNoticeCubit extends Cubit<UpdateNoticeState> {
  final UpdatedNoticeUseCase _updated;
  UpdateNoticeCubit({required UpdatedNoticeUseCase updated})
      : _updated = updated,
        super(UpdateNoticeState());

  Future<void> updateNotice(UpdateNoticeParams params) async {
    try {
      await _sendUpdateToDB(params)
          .then((status) => emit(UpdateNoticeSuccess(status: status)));
    } on ServerException catch (e) {
      emit(UpdateNoticeFailed(message: e.message));
    }
  }

  Future<ResponseStatus> _sendUpdateToDB(UpdateNoticeParams params) async {
    final result = await _updated.execute(params);
    return result.fold(
        (f) => throw ServerException(f.toString()), (status) => status);
  }
}
