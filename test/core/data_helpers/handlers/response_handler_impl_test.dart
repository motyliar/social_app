import 'dart:io';

import 'package:climbapp/core/datahelpers/handlers/response_handlers.impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

void main() {
  ResponseHandler handler = ResponseHandler();

  group("checkStatusCodeAndReturnData", () {
    test("checkStatusCodeAndReturnData should return Right()", () async {
      //Arrange
      final Response response = Response('''
      {
        "test": "test"
        }
       ''', HttpStatus.ok);
      //Act
      final check = await handler.checkStatusCodeAndReturnData(response);
      //Assert
      expect(check, isA<Right>());
    });
    test("checkStatusCodeAndReturnData should return Left()", () async {
      //Arrange
      final Response response = Response('''
      {
        "test": "test"
        }
       ''', HttpStatus.notFound);
      //Act
      final check = await handler.checkStatusCodeAndReturnData(response);
      //Assert
      expect(check, isA<Left>());
    });
    test("checkStatusCodeAndReturnData should return Left()", () async {
      //Arrange
      final Response response = Response('''
      {
        "test": "test"
        }
       ''', HttpStatus.internalServerError);
      //Act
      final check = await handler.checkStatusCodeAndReturnData(response);
      //Assert
      expect(check, isA<Left>());
    });
  });
}
