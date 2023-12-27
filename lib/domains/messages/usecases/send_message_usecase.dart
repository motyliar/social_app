import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';
import 'package:climbapp/core/utils/utils.dart';

class SendMessageUseCase extends UseCase<String, MessageParams> {
  SendMessageUseCase({required MessagesRepository messagesRepository})
      : _messagesRepository = messagesRepository;
  final MessagesRepository _messagesRepository;

  @override
  EitherFunc<String> execute(MessageParams message) {
    return _messagesRepository.sendMessage(message);
  }
}
