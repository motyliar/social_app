part of 'update_comment_cubit.dart';

class UpdateCommentState extends Equatable {
  const UpdateCommentState();

  @override
  List<Object> get props => [];
}

final class UpdateCommentSuccess extends UpdateCommentState {
  UpdateCommentSuccess({required this.status});

  final ResponseStatus status;

  @override
  List<Object> get props => [status];
}

final class UpdateCommentFailed extends UpdateCommentState {
  UpdateCommentFailed({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
