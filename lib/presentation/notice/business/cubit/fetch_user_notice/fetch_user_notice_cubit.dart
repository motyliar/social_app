import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/usecases/find_notices_created_by_user.dart';
import 'package:equatable/equatable.dart';

part 'fetch_user_notice_state.dart';

class FetchUserNoticeCubit extends Cubit<FetchUserNoticeState> {
  final FindNoticesCreatedByUserUseCase _fetch;
  FetchUserNoticeCubit({required FindNoticesCreatedByUserUseCase fetch})
      : _fetch = fetch,
        super(FetchUserNoticeLoading());

  Future<void> fetchReturnByState(GetNoticeParams params) async {
    try {
      await _getResponseFromDB(params)
          .then((data) => emit(state.copyWith(userNotices: List.from(data))));
    } on ServerException catch (e) {
      emit(FetchUserNoticeFailed(error: e.message));
    }
  }

  Future<List<NoticeEntity>> _getResponseFromDB(GetNoticeParams params) async {
    return await _fetch.execute(params).then((response) =>
        response.fold((failure) => throw failure, (data) => data));
  }
}
