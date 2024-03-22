import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/usecases/delete_user_single_notice_usecase.dart';
import 'package:climbapp/domains/notice/usecases/find_notices_created_by_user.dart';
import 'package:equatable/equatable.dart';

part 'fetch_user_notice_state.dart';

class FetchUserNoticeCubit extends Cubit<FetchUserNoticeState> {
  final FindNoticesCreatedByUserUseCase _fetch;
  final DeleteUserSingleNoticeUseCase _delete;
  FetchUserNoticeCubit(
      {required FindNoticesCreatedByUserUseCase fetch,
      required DeleteUserSingleNoticeUseCase delete})
      : _fetch = fetch,
        _delete = delete,
        super(FetchUserNoticeLoading());

  Future<void> fetchReturnByState(GetNoticeParams params) async {
    try {
      await _getResponseFromDB(params)
          .then((data) => emit(state.copyWith(userNotices: List.from(data))));
    } on ServerException catch (e) {
      emit(FetchUserNoticeFailed(error: e.message));
    }
  }

  Future<void> deleteNotice(GetNoticeParams params, int index) async {
    await _deleteNotice(params, index);
  }

  Future<List<NoticeEntity>> _getResponseFromDB(GetNoticeParams params) async {
    return await _fetch.execute(params).then((response) =>
        response.fold((failure) => throw failure, (data) => data));
  }

  Future<void> _deleteNotice(GetNoticeParams params, int index) async {
    emit(FetchReloading(userNotices: state.userNotices));
    try {
      await _sendRequestToDb(params, index).then(
        (value) {
          emit(
            state.copyWith(
              userNotices: _removeData(state.userNotices, index),
            ),
          );
        },
      );
    } on ServerException catch (e) {
      emit(FetchUserNoticeFailed(error: e.message));
    }
  }

  Future<ResponseStatus> _sendRequestToDb(
      GetNoticeParams params, int index) async {
    return await _delete
        .execute(params)
        .then((response) => response.fold((f) => throw f, (r) => r));
  }
}

List<NoticeEntity> _removeData(List<NoticeEntity> notices, int index) {
  notices.removeAt(index);
  return notices;
}
