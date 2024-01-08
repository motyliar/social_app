// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class MessageRequestParams extends RepositoryParams {
  const MessageRequestParams(
      {required super.url,
      required this.direction,
      required this.singleMessage});
  final String direction;
  final SingleMessage singleMessage;
  @override
  Map<String, dynamic> requestMapBody() => {
        "message": {
          "to": singleMessage.to,
          "from": singleMessage.from,
          "sender": singleMessage.sender,
          "recipient": singleMessage.recipient,
          "subject": singleMessage.subject,
          "content": singleMessage.content
        }
      };
}

class SingleMessage {
  final String to;
  final String from;
  final String sender;
  final String recipient;
  final String subject;
  final String content;
  SingleMessage({
    required this.to,
    required this.from,
    required this.sender,
    required this.recipient,
    required this.subject,
    required this.content,
  });
}
