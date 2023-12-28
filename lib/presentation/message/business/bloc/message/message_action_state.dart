part of 'message_action_bloc.dart';

sealed class MessageActionState extends Equatable {
  const MessageActionState({this.messages = const <MessageEntity>[]});

  final List<MessageEntity> messages;

  @override
  List<Object> get props => [messages];
}

final class MessageActionInitial extends MessageActionState {}

final class MessageLoaded extends MessageActionState {
  const MessageLoaded(List<MessageEntity> messages) : super(messages: messages);

  @override
  List<Object> get props => [messages];
}

final class MessageActionSuccess extends MessageActionState {}

final class MessageActionFailed extends MessageActionState {}
