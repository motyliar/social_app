part of 'message_action_bloc.dart';

sealed class MessageActionEvent extends Equatable {
  const MessageActionEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends MessageActionEvent {
  const SendMessageEvent({required this.params});
  final MessageParams params;
  @override
  List<Object> get props => [params];
}

class LoadUserMessagesEvent extends MessageActionEvent {
  const LoadUserMessagesEvent({required this.params});
  final GetMessageParams params;
  @override
  List<Object> get props => [params];
}

class DeleteMessagesEvent extends MessageActionEvent {
  const DeleteMessagesEvent({required this.params});
  final GetMessageParams params;
  @override
  List<Object> get props => [params];
}
