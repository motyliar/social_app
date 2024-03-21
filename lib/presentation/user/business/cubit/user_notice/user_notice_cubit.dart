import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_notice_state.dart';

class UserNoticeCubit extends Cubit<UserNoticeState> {
  UserNoticeCubit() : super(UserNoticeInitial());
}
