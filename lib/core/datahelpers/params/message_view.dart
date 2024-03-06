import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';

class MessageViewParams {
  const MessageViewParams({required this.view, this.friend});
  final MessageView view;
  final FriendsEntity? friend;
}
