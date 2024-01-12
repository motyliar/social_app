import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/usecases/delete_user_single_notice_usecase.dart';
import 'package:equatable/equatable.dart';

part 'delete_notice_state.dart';

class DeleteNoticeCubit extends Cubit<DeleteNoticeState> {
  final DeleteUserSingleNoticeUseCase _delete;
  DeleteNoticeCubit({required DeleteUserSingleNoticeUseCase delete})
      : _delete = delete,
        super(DeleteNoticeState());

  Future<void> deleteNotice(GetNoticeParams params) async {
    await _deleteNotice(params);
  }

  Future<void> _deleteNotice(GetNoticeParams params) async {
    try {
      await _sendRequestToDb(params)
          .then((value) => emit(DeleteNoticeSuccess(status: value)));
    } on ServerException catch (e) {
      emit(DeleteNoticeFailed(message: e.message));
    }
  }

  Future<ResponseStatus> _sendRequestToDb(GetNoticeParams params) async {
    return await _delete
        .execute(params)
        .then((response) => response.fold((f) => throw f, (r) => r));
  }
}
