import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';

abstract class MessagesRepository {
  EitherFunc<String> sendMessage(MessageRequestParams message);
  EitherFunc<List<MessageEntity>> getUserMessage(GetMessageParams params);
  EitherFunc<String> deleteMessage(MessageDeleteParams delete);
  EitherFunc<String> updateMessage(MessageUpdateParams update);
}
