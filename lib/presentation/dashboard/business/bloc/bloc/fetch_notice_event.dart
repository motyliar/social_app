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
