part of 'fetch_single_notice_cubit.dart';

sealed class FetchSingleNoticeState extends Equatable {
  const FetchSingleNoticeState();

  @override
  List<Object> get props => [];
}

final class FetchSingleNoticeInitial extends FetchSingleNoticeState {}
