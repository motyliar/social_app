import 'package:bloc/bloc.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/messages/usecases/send_message_usecase.dart';
import 'package:equatable/equatable.dart';

part 'message_action_event.dart';
part 'message_action_state.dart';

class MessageActionBloc extends Bloc<MessageActionEvent, MessageActionState> {
  final SendMessageUseCase _sendMessageUseCase;
  MessageActionBloc(SendMessageUseCase sendMessageUseCase)
      : _sendMessageUseCase = sendMessageUseCase,
        super(MessageActionInitial()) {
    on<SendMessageEvent>(_sendMessage);
  }
  Future<void> _sendMessage(
      SendMessageEvent event, Emitter<MessageActionState> emit) async {
    final result = await _sendMessageUseCase.execute(event.params);

    result.fold((fail) => emit(MessageActionFailed()),
        (data) => emit(MessageActionSuccess()));
  }
}
