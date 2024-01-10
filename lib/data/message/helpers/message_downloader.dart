import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';

class MessageDownloader {
  const MessageDownloader(GetMessageParams getMessageParams)
      : _getMessageParams = getMessageParams;
  final GetMessageParams _getMessageParams;

  Future<List<dynamic>> fetchMessageData() async {
    return await HttpPostDataHandler(params: _getMessageParams)
        .returnData<List<dynamic>>(dataGetter: _getMessageParams.direction)
        .then((r) => r.fold((failure) => throw failure, (data) => data));
  }
}
