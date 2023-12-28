import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';

class UpdateMessageUseCase extends UseCase<String, GetMessageParams> {
  UpdateMessageUseCase({required MessagesRepository messagesRepository})
      : _messagesRepository = messagesRepository;
  final MessagesRepository _messagesRepository;

  @override
  EitherFunc<String> execute(GetMessageParams update) {
    return _messagesRepository.updateMessage(update);
  }
}
