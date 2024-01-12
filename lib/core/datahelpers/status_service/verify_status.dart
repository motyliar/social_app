import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';

abstract class IStatusVerifier<T> {
  Future<String> fetchResponseDescription_();

  IStatusVerifier();

  Future<ResponseStatus> verifyResponse() async {
    return await _verifyResponse();
  }

  Future<ResponseStatus> _verifyResponse() async {
    final response = await fetchResponseDescription_();
    if (response == "success") {
      return ResponseStatus.success;
    } else {
      throw ServerException('bad-response');
    }
  }
}
