import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';

import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/usecases/get_single_notice_usecase.dart';
import 'package:equatable/equatable.dart';

part 'fetch_single_notice_state.dart';

class FetchSingleNoticeCubit extends Cubit<FetchSingleNoticeState> {
  final GetSingleNoticeUseCase _getSingleNoticeUseCase;
  FetchSingleNoticeCubit(
      {required GetSingleNoticeUseCase getSingleNoticeUseCase})
      : _getSingleNoticeUseCase = getSingleNoticeUseCase,
        super(const FetchSingleNoticeState());

  Future<void> emitResultOfFetching(GetNoticeParams params) async {
    try {
      await _fetchSingleNotice(params)
          .then((e) => emit(state.copyWith(notice: e)));
    } catch (e) {
      emit(FetchSingleNoticeFailure());
    }
  }

  Future<NoticeEntity> _fetchSingleNotice(GetNoticeParams params) async {
    return await _getSingleNoticeUseCase.execute(params).then((result) =>
        result.fold((f) => throw ServerException.message(f.toString()),
            (data) => data));
  }
}
