import 'package:climbapp/data/message/models/message_model.dart';

/// File params contains classes of Params used in Repository UseCase

/// [GetUserParams] store 2 variables for UserGetUseCase
class GetUserParams {
  const GetUserParams({required this.token, required this.userId});
  final String token;
  final String userId;

  @override
  toString() => 'token: $token , userId: $userId';
}

class UpdateUserParams<T> {
  const UpdateUserParams(
      {required this.userId, required this.token, required this.toUpdate});
  final String userId;
  final String token;
  final Map<String, T> toUpdate;
}

class GetFriendsParams {
  const GetFriendsParams({required this.userId, this.friendId, this.friendIds});
  final String userId;
  final String? friendId;
  final List<String>? friendIds;
}

class MessageParams {
  const MessageParams(
      {required this.to,
      required this.from,
      required this.sender,
      required this.recipient,
      required this.subject,
      required this.content});
  final String to;
  final String from;
  final String sender;
  final String recipient;
  final String subject;
  final String content;
}

/// [MessageUserDetails] are use to store details about sender and recipient
/// [senderName] keep user name
/// [senderId] keep user id in MongoDB to find user in DB
/// [recipientName] keep name of Friends which will get message
/// [recipientId] keep Friend Id to store message in right place
class MessageUserDetails {
  const MessageUserDetails(
      {required this.senderName,
      required this.senderId,
      required this.recipientName,
      required this.recipientId});
  final String senderName;
  final String senderId;
  final String recipientName;
  final String recipientId;

  @override
  toString() =>
      "senderName: $senderName\n senderId: $senderId\n recipientName: $recipientName\n recipientId $recipientId";
}

class GetMessageParams<T> {
  const GetMessageParams(
      {required this.userId,
      required this.direction,
      this.messageId,
      this.field,
      this.delete,
      this.update});
  final String userId;
  final String direction;
  final String? messageId;
  final List<String>? delete;
  final String? field;
  final T? update;

  /// [requestBody] map creator for body in get user message
  Map<String, String> requestBody() => {"direction": direction};

  /// [deleteRequestBody] map creator for delete single message from DB
  Map<String, dynamic> deleteRequestBody() =>
      {"delete": delete!, "direction": direction};

  Map<String, dynamic> updateRequestBody() => {
        "messageID": messageId,
        "direction": direction,
        "update": update,
        "field": field,
      };

  @override
  String toString() =>
      'GetMessageParams(userId: $userId, direction: $direction)';
}
