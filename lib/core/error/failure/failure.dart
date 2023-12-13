abstract class Failure {
  const Failure({required this.message});
  final String message;
}

class ServerFailure extends Failure {
  const ServerFailure(String message)
      : super(message: 'server failure: $message');
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message)
      : super(message: 'network failure: $message');
}

class SocketFailure extends Failure {
  const SocketFailure(String message)
      : super(message: 'socket failure: $message');
}
