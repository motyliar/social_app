import 'package:climbapp/data/message/models/message_model.dart';

class ResponseConventer {
  const ResponseConventer(List<dynamic> responseData)
      : _responseData = responseData;
  final List<dynamic> _responseData;

  List<MessageModel> mapResponseToMessageModel() {
    return _mapResponseToMessageModel();
  }

  List<MessageModel> _mapResponseToMessageModel() {
    return _responseData.map((e) => MessageModel.fromJson(e)).toList();
  }
}
