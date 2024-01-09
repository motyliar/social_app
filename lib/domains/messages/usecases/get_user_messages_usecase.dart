import 'package:climbapp/core/datahelpers/params/message_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/message/repository/message_repository_impl.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';

class GetUserMessagesUseCase
    extends UseCase<List<MessageEntity>, GetMessageParams> {
  GetUserMessagesUseCase({required MessagesRepository messagesRepository})
      : _messageRepository = messagesRepository;
  final MessagesRepository _messageRepository;

  @override
  EitherFunc<List<MessageEntity>> execute(GetMessageParams params) {
    return _messageRepository.getUserMessage(params);
  }
}
