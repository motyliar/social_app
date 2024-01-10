import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http.delete_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_put_data_hanlder.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/message/helpers/message_downloader.dart';
import 'package:climbapp/data/message/helpers/response_conventer.dart';
import 'package:climbapp/data/message/models/message_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

const String _dataGetter = 'status';

abstract class MessageRemoteDataSources {
  EitherFunc<String> sendMessage(MessageRequestParams params);
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params);
  EitherFunc<String> deleteMessage(MessageDeleteParams delete);
  EitherFunc<String> updateMessage(MessageUpdateParams update);
}

class MessageRemoteDataSourcesImpl extends MessageRemoteDataSources {
  MessageRemoteDataSourcesImpl({required this.client});
  final http.Client client;

  @override
  EitherFunc<String> sendMessage(MessageRequestParams params) async {
    return HttpPostDataHandler(params: params)
        .returnData(dataGetter: _dataGetter);
  }

  @override
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params) async {
    try {
      final responseData = MessageDownloader(params).fetchMessageData();
      final mappedData =
          ResponseConventer(await responseData).mapResponseToMessageModel();
      return Right(mappedData);
    } catch (e) {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<String> deleteMessage(MessageDeleteParams delete) async {
    return await HttpDeleteDataHandler(params: delete)
        .returnData(dataGetter: _dataGetter);
  }

  @override
  EitherFunc<String> updateMessage(MessageUpdateParams update) async {
    return await HttpPutDataHandler(params: update)
        .returnData(dataGetter: _dataGetter);
  }
}
