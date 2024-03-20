import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/directions.dart';
import 'package:climbapp/domains/notice/usecases/get_notice_pagination_usecase.dart';
import 'package:climbapp/domains/notice/usecases/update_user_id_join_arrays_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'fetch_notice_event.dart';
part 'fetch_notice_state.dart';

class FetchNoticeBloc extends Bloc<FetchNoticeEvent, FetchNoticeState> {
  final GetNoticePaginationUseCase _getNoticePaginationUseCase;
  final UpdateUserIdJoinArraysUseCase _updateArrays;
  FetchNoticeBloc(
      {required GetNoticePaginationUseCase getNoticePaginationUseCase,
      required UpdateUserIdJoinArraysUseCase updateArrays})
      : _getNoticePaginationUseCase = getNoticePaginationUseCase,
        _updateArrays = updateArrays,
        super(const FetchNoticeLoading()) {
    on<FetchNoticesFromDB>(_fetchNotice);
    on<UpdateNoticeJoinArrays>(_addUpdateArrays);
    on<DeleteNoticeJoinID>(_deleteID);
    on<DeleteComment>(_deleteComment);
  }

  Future<void> _fetchNotice(
      FetchNoticesFromDB event, Emitter<FetchNoticeState> emit) async {
    try {
      await _getNoticeData(event.params).then((data) => emit(state.copyWith(
            notices: List.from(data),
          )));
    } catch (e) {
      emit(FetchNoticeFailed());
    }
  }

  Future<List<NoticeEntity>> _getNoticeData(GetNoticeParams params) async {
    return await _getNoticePaginationUseCase
        .execute(params)
        .then((response) => response.fold((failure) {
              throw ServerException.message(failure.toString());
            }, (data) => data));
  }

  Future<void> _addUpdateArrays(
      UpdateNoticeJoinArrays event, Emitter<FetchNoticeState> emit) async {
    emit(FetchNoticeReloading(notices: state.notices));
    try {
      await _getResponseFromUpdate(event.params).then((value) {
        final notices = state.notices;
        if (event.params.direction == Direction.request) {
          notices[event.index].requests!.add(event.params.userId);

          emit(state.copyWith(notices: List.from(notices)));
        } else {
          notices[event.index].interested!.add(event.params.userId);
          emit(state.copyWith(notices: List.from(notices)));
        }
      });
    } catch (e) {
      emit(FetchNoticeFailed());
    }
  }

  Future<void> _deleteID(
      DeleteNoticeJoinID event, Emitter<FetchNoticeState> emit) async {
    emit(FetchNoticeReloading(notices: state.notices));
    try {
      await _getResponseFromUpdate(event.params).then((value) {
        final notices = state.notices;
        if (event.params.direction == Direction.request) {
          notices[event.index].requests!.remove(event.params.userId);

          emit(state.copyWith(notices: List.from(notices)));
        } else {
          notices[event.index].interested!.remove(event.params.userId);
          emit(state.copyWith(notices: List.from(notices)));
        }
      });
    } catch (e) {
      emit(FetchNoticeFailed());
    }
  }

  Future<void> _getResponseFromUpdate(UpdateRequestJoinParams params) async {
    return await _updateArrays
        .execute(params)
        .then((response) => response.fold((l) => l, (r) => r));
  }

  void _deleteComment(DeleteComment event, Emitter<FetchNoticeState> emit) {
    emit(FetchNoticeReloading(notices: state.notices));
    try {
      final notices = state.notices;
      notices[event.index].comments!.removeAt(event.commentIndex);
      emit(
        state.copyWith(
          notices: List.from(notices),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
