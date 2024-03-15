import 'package:bloc/bloc.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/sports_category.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/type_action.dart';
import 'package:equatable/equatable.dart';

part 'user_notice_data_state.dart';

String _dataNow = DateTime.now().toString();

class UserNoticeDataCubit extends Cubit<UserNoticeDataState> {
  UserNoticeDataCubit() : super(UserNoticeDataState(date: _dataNow));

  void changeData(String value) {
    emit(state.copyWith(date: value));
  }

  void changeCategory(NoticeCategory value) {
    emit(state.copyWith(category: value));
  }

  void changeActionType(ActionType type) {
    emit(state.copyWith(type: type));
  }
}
