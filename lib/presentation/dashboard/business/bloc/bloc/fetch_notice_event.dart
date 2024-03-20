part of 'fetch_notice_bloc.dart';

sealed class FetchNoticeEvent extends Equatable {
  const FetchNoticeEvent();

  @override
  List<Object> get props => [];
}

class FetchNoticesFromDB extends FetchNoticeEvent {
  const FetchNoticesFromDB({required this.params});
  final GetNoticeParams params;
  @override
  List<Object> get props => [params];
}

class UpdateNoticeJoinArrays extends FetchNoticeEvent {
  const UpdateNoticeJoinArrays({required this.params, required this.index});
  final UpdateRequestJoinParams params;
  final int index;
  @override
  List<Object> get props => [params];
}

class DeleteNoticeJoinID extends FetchNoticeEvent {
  const DeleteNoticeJoinID({required this.params, required this.index});
  final UpdateRequestJoinParams params;
  final int index;
  @override
  List<Object> get props => [params];
}

class DeleteComment extends FetchNoticeEvent {
  const DeleteComment({required this.index, required this.commentIndex});
  final int index;
  final int commentIndex;

  @override
  List<Object> get props => [index];
}
