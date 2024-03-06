import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

const String _nameValue = "name";
const String _check = "isCheck";
const int _durationInSeconds = 1;

class MessageLogic {
  static List<Map> boolCreator(int index) {
    List<Map> newList = [];
    for (var i = 0; i < index; i++) {
      newList.add({"name": i, "isCheck": false});
    }
    return newList;
  }

  static Future<void> refreshState(
      {required VoidCallback refreshFunction,
      int durationInSeconds = _durationInSeconds}) async {
    Future.delayed(
        Duration(seconds: durationInSeconds), () => refreshFunction());
  }

  static List<String> generateIdsList({required List<MessageEntity> messages}) {
    return List.generate(messages.length, (index) => messages[index].id)
        .toList();
  }

  static List<Map<String, dynamic>> generateCheckedBox(
      {required int listSize, bool wantToCheck = true}) {
    return List.generate(
        listSize, (index) => {"name": index, "isCheck": wantToCheck}).toList();
  }

  static String createReMessageTemplate(MessageEntity message) => '''
    ${message.sender} sent on ${message.createdAt}
    previous message:

    ${message.content}''';
}
