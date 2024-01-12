import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/domains/notice/usecases/create_new_notice.dart';
import 'package:equatable/equatable.dart';

part 'create_notice_state.dart';

class CreateNoticeCubit extends Cubit<CreateNoticeState> {
  final CreateNewNoticeUseCase _createNewNoticeUseCase;
  CreateNoticeCubit({required CreateNewNoticeUseCase createNewNoticeUseCase})
      : _createNewNoticeUseCase = createNewNoticeUseCase,
        super(CreateNoticeInitial());

  Future<void> sendNewNoticeToServer(CreateNoticeParams params) async {
    try {
      await _handleResponseFromServer(params)
          .then((response) => emit(CreateNoticeSuccess(response: response)));
    } catch (e) {
      emit(CreateNoticeFailed());
    }
  }

  Future<ResponseStatus> _handleResponseFromServer(
      CreateNoticeParams params) async {
    return await _createNewNoticeUseCase.execute(params).then((response) =>
        response.fold((failure) => throw failure, (data) => data));
  }
}
