/// [Exception] class to handling exceptions from repository class

library;

import 'dart:convert';

import 'package:climbapp/core/constans/constans.dart';

abstract class AppExceptions implements Exception {
  const AppExceptions({required this.message});

  /// variable [message] are used for transport [Exception] message
  final String message;
  @override
  String toString() => message;
}

///Class used for handling [Exception] when is checking internet connection
/// [NetworkException] passed exception when, app have not connection to net
class NetworkException extends AppExceptions {
  NetworkException(String message) : super(message: message);

  factory NetworkException.disconnection() => NetworkException(kDisconnect);
}

class FirebaseCodeExceptions extends AppExceptions {
  FirebaseCodeExceptions(String message) : super(message: message);
}

/// [ServerException] class used when server send bad status or dosnt response
/// [ServerException.errorMessage] passed messeges from replies
class ServerException extends AppExceptions {
  ServerException(String message) : super(message: message);
  factory ServerException.errorMessage({
    required String responseBody,
    String messageKey = 'message',
  }) {
    final serverMessage = jsonDecode(responseBody)[messageKey] as String;
    return ServerException(serverMessage);
  }
  factory ServerException.message(String message) => ServerException(message);
  factory ServerException.error() => ServerException(kSomethingGoesWrong);
  factory ServerException.failed() => ServerException(kFailure);
  factory ServerException.notFound() => ServerException(kNotFound);
  factory ServerException.parseData() => ServerException(kParseData);
}

/// [HiveExceptions] is use for handling exception when local DB have not any
/// data to pass
class HiveExceptions extends AppExceptions {
  const HiveExceptions(String message) : super(message: message);

  factory HiveExceptions.emptyData() => const HiveExceptions(kNoData);
}
