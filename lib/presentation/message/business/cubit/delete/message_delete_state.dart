part of 'message_delete_cubit.dart';

class MessageDeleteState extends Equatable {
  const MessageDeleteState({this.messageIds = const <String>[]});
  final List<String> messageIds;

  MessageDeleteState copyWith({final List<String>? messageIds}) =>
      MessageDeleteState(messageIds: messageIds ?? this.messageIds);

  @override
  List<Object> get props => [messageIds];
}
