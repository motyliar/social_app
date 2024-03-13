import 'package:bloc/bloc.dart';

import 'package:climbapp/presentation/user/business/enum.dart';

import 'package:equatable/equatable.dart';

part 'view_switch_state.dart';

class ViewSwitchCubit extends Cubit<ViewSwitchState> {
  ViewSwitchCubit() : super(ViewSwitchInitial());

  void changeStatus(ViewStatus viewStatus) {
    switch (viewStatus) {
      case ViewStatus.main:
        emit(ViewSwitchInitial());

      case ViewStatus.settings:
        emit(ViewSwitchSettings());

      case ViewStatus.info:
        emit(ViewSwitchInfo());

      case ViewStatus.sport:
        emit(ViewSwitchSport());

      case ViewStatus.notice:
        emit(ViewSwitchNotice());
    }
  }
}
