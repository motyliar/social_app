class AppUrl {
  /// [backendUrl] general address for MongoDB server
  /// [userEndPoint] store endpoint of user DB
  static const String backendUrl = 'http://192.168.1.41:3000/';
  static const String middleWare = '1983_12@45bv/';
  static const String userEndPoint = 'climbuser/';
  static const String connectionTest = 'connection/';
  static String authApi(String authDirection) => '$backendUrl$authDirection';

  /// [userApi] endpoint for fetch user data after login
  static String userApi() => '$backendUrl$middleWare$userEndPoint';

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
