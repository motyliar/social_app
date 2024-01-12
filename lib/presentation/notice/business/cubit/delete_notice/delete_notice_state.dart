part of 'delete_notice_cubit.dart';

class DeleteNoticeState extends Equatable {
  const DeleteNoticeState();

  @override
  List<Object> get props => [];
}

final class DeleteNoticeFailed extends DeleteNoticeState {
  const DeleteNoticeFailed({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}

class DeleteNoticeSuccess extends DeleteNoticeState {
  const DeleteNoticeSuccess({required this.status});
  final ResponseStatus status;
  @override
  List<Object> get props => [status];
}
