import 'package:climbapp/core/datahelpers/params/message_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';

class UpdateMessageUseCase extends UseCase<String, MessageUpdateParams> {
  UpdateMessageUseCase({required MessagesRepository messagesRepository})
      : _messagesRepository = messagesRepository;
  final MessagesRepository _messagesRepository;

  @override
  EitherFunc<String> execute(MessageUpdateParams update) {
    return _messagesRepository.updateMessage(update);
  }
}
