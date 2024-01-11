part of 'create_notice_cubit.dart';

sealed class CreateNoticeState extends Equatable {
  const CreateNoticeState();

  @override
  List<Object?> get props => [];
}

final class CreateNoticeInitial extends CreateNoticeState {}

final class CreateNoticeSuccess extends CreateNoticeState {
  const CreateNoticeSuccess({this.response});
  final ResponseStatus? response;
  @override
  List<Object?> get props => [response];
}

final class CreateNoticeFailed extends CreateNoticeState {}
