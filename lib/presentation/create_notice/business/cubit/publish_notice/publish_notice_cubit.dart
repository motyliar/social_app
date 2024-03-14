import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/domains/notice/usecases/create_new_notice.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'publish_notice_state.dart';

class PublishNoticeCubit extends Cubit<PublishNoticeState> {
  final CreateNewNoticeUseCase _create;
  PublishNoticeCubit({required CreateNewNoticeUseCase create})
      : _create = create,
        super(PublishNoticeInitial());

  Future<void> sendNotice(CreateNoticeParams params) async {
    return _handleResposne(params);
  }

  Future<void> _handleResposne(CreateNoticeParams params) async {
    try {
      await _responseFromSending(params)
          .then((value) => emit(PublishNoticeSuccess()));
    } catch (e) {
      debugPrint(e.toString());
      emit(PublishNoticeFail());
    }
  }

  Future<ResponseStatus> _responseFromSending(CreateNoticeParams params) async {
    return await _create
        .execute(params)
        .then((response) => response.fold((l) => throw l, (status) => status));
  }
}
