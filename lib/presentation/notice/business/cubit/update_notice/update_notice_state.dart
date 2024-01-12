part of 'update_notice_cubit.dart';

class UpdateNoticeState extends Equatable {
  const UpdateNoticeState();

  @override
  List<Object> get props => [];
}

final class UpdateNoticeSuccess extends UpdateNoticeState {
  const UpdateNoticeSuccess({required this.status});
  final ResponseStatus status;
  @override
  List<Object> get props => [status];
}

final class UpdateNoticeFailed extends UpdateNoticeState {
  const UpdateNoticeFailed({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
