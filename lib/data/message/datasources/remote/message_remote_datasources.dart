import 'package:climbapp/core/datahelpers/params/message_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http.delete_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_put_data_hanlder.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
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

  Future<List<dynamic>> _fetchMessageData(GetMessageParams params) async {
    return await HttpPostDataHandler(params: params)
        .returnData<List<dynamic>>(dataGetter: params.direction)
        .then((r) => r.fold((failure) => throw failure, (data) => data));
  }

  List<MessageModel> _mapResponseToMessageModel(List<dynamic> responseData) {
    return responseData.map((e) => MessageModel.fromJson(e)).toList();
  }

  @override
  EitherFunc<String> sendMessage(MessageRequestParams params) async {
    return HttpPostDataHandler(params: params)
        .returnData(dataGetter: _dataGetter);
  }

  @override
  EitherFunc<List<MessageModel>> getUserMessage(GetMessageParams params) async {
    try {
      final responseData = _fetchMessageData(params);
      final mappedData = _mapResponseToMessageModel(await responseData);
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
