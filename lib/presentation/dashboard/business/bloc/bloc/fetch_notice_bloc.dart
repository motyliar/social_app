import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/usecases/get_notice_pagination_usecase.dart';
import 'package:equatable/equatable.dart';

part 'fetch_notice_event.dart';
part 'fetch_notice_state.dart';

class FetchNoticeBloc extends Bloc<FetchNoticeEvent, FetchNoticeState> {
  final GetNoticePaginationUseCase _getNoticePaginationUseCase;
  FetchNoticeBloc(
      {required GetNoticePaginationUseCase getNoticePaginationUseCase})
      : _getNoticePaginationUseCase = getNoticePaginationUseCase,
        super(const FetchNoticeState()) {
    on<FetchNoticesFromDB>(_fetchNotice);
  }

  Future<void> _fetchNotice(
      FetchNoticesFromDB event, Emitter<FetchNoticeState> emit) async {
    try {
      await _getNoticeData(event.params)
          .then((data) => emit(state.copyWith(notices: List.from(data))));
    } catch (e) {
      emit(FetchNoticeFailed());
    }
  }

  Future<List<NoticeEntity>> _getNoticeData(GetNoticeParams params) async {
    return await _getNoticePaginationUseCase.execute(params).then((response) =>
        response.fold(
            (failure) => throw ServerException.message(failure.toString()),
            (data) => data));
  }
}
