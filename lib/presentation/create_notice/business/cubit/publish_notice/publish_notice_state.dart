part of 'publish_notice_cubit.dart';

sealed class PublishNoticeState extends Equatable {
  const PublishNoticeState();

  @override
  List<Object> get props => [];
}

final class PublishNoticeInitial extends PublishNoticeState {}

final class PublishNoticeSuccess extends PublishNoticeState {}

final class PublishNoticeFail extends PublishNoticeState {}
