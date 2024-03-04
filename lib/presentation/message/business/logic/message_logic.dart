import 'package:climbapp/presentation/app.dart';
import 'package:flutter/material.dart';

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
}
