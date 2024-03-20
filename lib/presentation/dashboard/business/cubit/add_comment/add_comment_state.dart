part of 'add_comment_cubit.dart';

class AddCommentState extends Equatable {
  const AddCommentState();

  @override
  List<Object> get props => [];
}

final class AddCommentSuccess extends AddCommentState {
  AddCommentSuccess({required this.status});
  final ResponseStatus status;
  @override
  List<Object> get props => [status];
}

final class AddCommentFailed extends AddCommentState {
  AddCommentFailed({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
