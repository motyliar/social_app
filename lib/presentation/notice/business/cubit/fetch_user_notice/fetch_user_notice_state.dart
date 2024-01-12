part of 'fetch_user_notice_cubit.dart';

class FetchUserNoticeState extends Equatable {
  const FetchUserNoticeState({this.userNotices = const <NoticeEntity>[]});
  final List<NoticeEntity> userNotices;

  FetchUserNoticeState copyWith({List<NoticeEntity>? userNotices}) =>
      FetchUserNoticeState(userNotices: userNotices ?? this.userNotices);

  @override
  List<Object> get props => [userNotices];
}

final class FetchUserNoticeLoading extends FetchUserNoticeState {}

final class FetchUserNoticeFailed extends FetchUserNoticeState {
  const FetchUserNoticeFailed({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
