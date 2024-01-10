import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_single_notice_state.dart';

class FetchSingleNoticeCubit extends Cubit<FetchSingleNoticeState> {
  FetchSingleNoticeCubit() : super(FetchSingleNoticeInitial());
}
