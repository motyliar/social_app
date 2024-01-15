part of 'delete_comment_cubit.dart';

class DeleteCommentState extends Equatable {
  const DeleteCommentState();

  @override
  List<Object> get props => [];
}

final class DeleteCommentSuccess extends DeleteCommentState {
  DeleteCommentSuccess({required this.status});
  final ResponseStatus status;
  @override
  List<Object> get props => [status];
}

final class DeleteCommentFailed extends DeleteCommentState {
  DeleteCommentFailed({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
