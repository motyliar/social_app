import 'package:climbapp/core/utils/helpers/params.dart';

class AppUrl {
  /// [backendUrl] general address for MongoDB server
  /// [userEndPoint] store endpoint of user DB
  static const String backendUrl = 'http://192.168.1.41:3000/';
  static const String middleWare = '1983_12@45bv/';
  static const String user = 'climbuser/';
  static const String userEndPoint = 'climbuser/single/';
  static const String connectionTest = 'connection/';
  static const String friends = 'userFriends/';
  static const String friend = 'friend/';
  static const String deleteAction = 'delete/';
  static const String addAction = 'add/';
  static const String updateAction = 'update/';
  static const String searchAction = 'search/';
  static const String messageendPoint = 'message/';
  static const String singleAction = 'single/';
  static const String manyAction = 'many/';
  static const String getUserMessage = 'userMessages/';
  static String authApi(String authDirection) => '$backendUrl$authDirection';

  /// [userApi] endpoint for fetch user data after login
  static String userApi() => '$backendUrl$middleWare$userEndPoint';
  static String updateUser() => '$backendUrl$middleWare$user';

  /// [getFriends] getter to set getting friends Api.
  static String getFriends(String userId) =>
      '$backendUrl$middleWare$user$friends$userId';

  /// [deleteFriend] url for delete single friend
  static String deleteFriend(String userId) =>
      '$backendUrl$middleWare$user$friend$deleteAction$userId';

  /// [addFriend] url for add friend to user friends list
  static String addFriend(String userId) =>
      '$backendUrl$middleWare$user$friend$addAction$userId';

  /// [sendMessageUrl] api Url for sending message to another user
  static String sendMessageUrl() =>
      '$backendUrl$messageendPoint$addAction$singleAction';

  /// [getUserMessages] general Api url to get all messages from user DB
  static String getUserMessages(String userId) =>
      '$backendUrl$messageendPoint$getUserMessage$userId';

  static String deleteMessage(String userId) =>
      '$backendUrl$messageendPoint$deleteAction$userId';

  static Uri updateMessage(String userId) =>
      Uri.parse('$backendUrl$messageendPoint$updateAction$userId');
  static String searchUsers(String name) =>
      '$backendUrl$middleWare$user$searchAction$name';

  ///
  static Map<String, dynamic> messageMap(MessageParams message) => {
        "message": {
          "to": message.to,
          "from": message.from,
          "sender": message.sender,
          "recipient": message.recipient,
          "subject": message.subject,
          "content": message.content
        }
      };

  /// [contentHeaders] general headers to get resposne from server of DB
  static const Map<String, String> contentHeaders = {
    'Content-Type': 'application/json',
  };

  /// [tokenHeaders] store general headers and return token to headers
  static Map<String, String> tokenHeaders(String token) => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
  static Map<String, String> loginMap({
    required String userEmail,
    required String userID,
  }) =>
      {'userEmail': userEmail, 'userAuthID': userID};
}
