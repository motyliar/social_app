import 'dart:convert';

import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:http/http.dart';

class MultiPartHandlers {
  Future<String> execute({required MultipartRequest request}) async {
    return await _executeResponse(request: request);
  }

  Future<String> _executeResponse({required MultipartRequest request}) async {
    final response = await _handleResponse(request);
    return jsonDecode(response)['file'];
  }

  Future<String> _handleResponse(MultipartRequest request) async {
    final response = await _getResponseFromRequest(request);
    return await _convertResponseToMap(response);
  }

  Future<String> _convertResponseToMap(StreamedResponse response) async {
    try {
      final convert = await response.stream.bytesToString();
      return convert;
    } catch (e) {
      throw ServerException.error();
    }
  }

  Future<StreamedResponse> _getResponseFromRequest(
      MultipartRequest request) async {
    try {
      final response = await request.send();
      return response;
    } catch (e) {
      throw ServerException.error();
    }
  }
}
