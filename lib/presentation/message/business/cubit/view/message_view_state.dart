part of 'message_view_cubit.dart';

sealed class MessageViewState extends Equatable {
  const MessageViewState();

  @override
  List<Object> get props => [];
}

final class MessageViewInitial extends MessageViewState {}

final class MessageViewSend extends MessageViewState {}

final class MessageViewRecivied extends MessageViewState {}

final class MessageViewNewMessage extends MessageViewState {}

final class MessageViewMessage extends MessageViewState {
  const MessageViewMessage({required this.message});
  final MessageEntity message;
  @override
  List<Object> get props => [message];
}
