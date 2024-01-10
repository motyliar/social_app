part of 'fetch_notice_bloc.dart';

class FetchNoticeState extends Equatable {
  const FetchNoticeState({this.notices = const <NoticeEntity>[]});
  final List<NoticeEntity> notices;

  @override
  List<Object> get props => [notices];

  FetchNoticeState copyWith(List<NoticeEntity>? notices) =>
      FetchNoticeState(notices: notices ?? this.notices);
}
