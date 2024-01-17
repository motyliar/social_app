import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';

import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';
import 'package:climbapp/domains/onBoard/usecase/change_open_status_usecase.dart';
import 'package:climbapp/domains/onBoard/usecase/get_open_status_usecase.dart';

import 'package:equatable/equatable.dart';

part 'first_open_state.dart';

class FirstOpenCubit extends Cubit<FirstOpenState> {
  final GetOpenStatusUseCase _getStatus;
  final ChangeOpenStatusUseCase _changeStatus;
  FirstOpenCubit._(
      {required GetOpenStatusUseCase getStatus,
      required ChangeOpenStatusUseCase changeStatus})
      : _getStatus = getStatus,
        _changeStatus = changeStatus,
        super(const FirstOpenState());
  Future<void> checkStatus() async {
    await _checkStatus();
  }

  Future<void> changeOpenStatus(OnBoardParam params) async {
    await _changeOpenStatus(params);
  }

  Future<void> _checkStatus() async {
    try {
      await _getStatusFromHive()
          .then((response) => emit(FirstOpenSuccess(status: response)));
    } on HiveExceptions catch (e) {
      emit(FirstOpenFailed(message: e.message));
    }
  }

  Future<OnBoardEntity> _getStatusFromHive() async {
    return await _getStatus.execute().then((value) =>
        value.fold((l) => throw HiveExceptions.emptyData(), (r) => r));
  }

  Future<void> _changeOpenStatus(OnBoardParam params) async {
    try {
      await _changeStatusInHive(params).then((value) => emit(FirstOpenSuccess(
          status: OnBoardEntity(wasOpened: params.wasOpened))));
    } on HiveExceptions catch (e) {
      emit(FirstOpenFailed(message: e.message));
    }
  }

  Future<ResponseStatus> _changeStatusInHive(OnBoardParam param) async {
    return await _changeStatus.execute(param).then((response) =>
        response.fold((l) => throw HiveExceptions.emptyData(), (r) => r));
  }
}
