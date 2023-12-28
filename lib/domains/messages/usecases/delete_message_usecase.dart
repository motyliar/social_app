import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/message/repository/message_repository_impl.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';

class DeleteMessageUseCase extends UseCase<String, GetMessageParams> {
  DeleteMessageUseCase({required MessagesRepository messagesRepository})
      : _messagesRepository = messagesRepository;
  final MessagesRepository _messagesRepository;

  @override
  EitherFunc<String> execute(GetMessageParams delete) {
    return _messagesRepository.deleteMessage(delete);
  }
}
