import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/message/datasources/remote/message_remote_datasources.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';

import 'package:dartz/dartz.dart';

class MessageRepositoryImpl extends MessagesRepository {
  MessageRepositoryImpl(
      {required MessageRemoteDataSources messageRemoteDataSources})
      : _messageRemoteDataSources = messageRemoteDataSources;
  final MessageRemoteDataSources _messageRemoteDataSources;

  @override
  EitherFunc<String> sendMessage(MessageParams message) async {
    if (await NetworkConnectedImpl().noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      final serverConnectionTest = await Utils().getServerConnection();
      if (serverConnectionTest.isRight()) {
        try {
          return await _messageRemoteDataSources.sendMessage(message).then(
              (response) => response.fold(
                  (failure) => Left(failure), (data) => Right(data)));
        } catch (error) {
          return Left(ServerException(error.toString()));
        }
      } else {
        return Left(ServerException.error());
      }
    }
  }
}
