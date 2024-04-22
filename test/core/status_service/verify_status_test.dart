import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/datahelpers/status_service/verify_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestStatusVerifier extends IStatusVerifier<String> {
  _TestStatusVerifier(this.response);
  final String response;
  @override
  Future<String> fetchResponseDescription_() async {
    return response;
  }
}

void main() {
  late _TestStatusVerifier testVerify;

  group("verifyStatus", () {
    test("should return ResponseStatus.succes", () async {
      //Arrange
      testVerify = _TestStatusVerifier("success");
      //Act
      final status = await testVerify.verifyResponse();
      //Assert
      expect(status, ResponseStatus.success);
    });
    test("should throw Exception()", () async {
      //Arrange
      testVerify = _TestStatusVerifier("failed");
      //Act

      //Assert
      expect(() async => await testVerify.verifyResponse(),
          throwsA(isInstanceOf<ServerException>()));
    });
  });
}
