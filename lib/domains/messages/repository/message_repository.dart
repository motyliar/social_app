// ignore: unused_import
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:dartz/dartz.dart';

abstract class MessagesRepository {
  EitherFunc<String> sendMessage(MessageParams message);
}
