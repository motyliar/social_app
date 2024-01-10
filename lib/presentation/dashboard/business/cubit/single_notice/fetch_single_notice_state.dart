part of 'fetch_single_notice_cubit.dart';

class FetchSingleNoticeState extends Equatable {
  const FetchSingleNoticeState({this.notice});
  final NoticeEntity? notice;

  FetchSingleNoticeState copyWith({NoticeEntity? notice}) =>
      FetchSingleNoticeState(notice: notice ?? this.notice);

  @override
  List<Object?> get props => [notice];
}

class FetchSingleNoticeFailure extends FetchSingleNoticeState {}
