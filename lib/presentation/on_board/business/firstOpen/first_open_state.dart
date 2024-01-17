part of 'first_open_cubit.dart';

class FirstOpenState extends Equatable {
  const FirstOpenState();

  @override
  List<Object> get props => [];
}

class FirstOpenSuccess extends FirstOpenState {
  const FirstOpenSuccess({required this.status});
  final OnBoardEntity status;
  FirstOpenSuccess copyWith(OnBoardEntity? status) =>
      FirstOpenSuccess(status: status ?? this.status);
  @override
  List<Object> get props => [status];
}

class FirstOpenFailed extends FirstOpenState {
  const FirstOpenFailed({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
