import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:flutter/widgets.dart';

class ExceptionHandler {
  const ExceptionHandler(this.error);
  final dynamic error;

  void execute() {
    if (error is ServerException) {
      debugPrint(error.message);
      throw ServerException.error();
    } else {
      debugPrint(error.toString());
      throw ServerException(error.toString());
    }
  }
}
