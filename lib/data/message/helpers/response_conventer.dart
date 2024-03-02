import 'package:climbapp/data/message/models/message_model.dart';
import 'package:flutter/material.dart';

class ResponseConverter {
  const ResponseConverter(dynamic responseData) : _responseData = responseData;
  final dynamic _responseData;

  List<MessageModel> mapResponseToMessageModel() {
    return _mapResponseToMessageModel();
  }

  List<MessageModel> _mapResponseToMessageModel() {
    final data = _responseData
        .map<MessageModel>((e) => MessageModel.fromJson(e))
        .toList();

    return data;
  }
}
