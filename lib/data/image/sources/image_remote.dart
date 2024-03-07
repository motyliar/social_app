import 'package:climbapp/core/datahelpers/handlers/multipart_handlers.dart';
import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_multipart_data.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ImageRemoteSource {
  Future<String> uploadImageToServer(ImageParams params);
}

class ImageRemoteSourceImpl extends ImageRemoteSource {
  @override
  Future<String> uploadImageToServer(ImageParams params) async {
    try {
      final request = await PostMultiPartData(params: params).sendRequest();
      final response = await MultiPartHandlers().execute(request: request);

      return response;
    } on ServerException catch (e) {
      debugPrint(e.toString());
    }
    throw ServerException.error();
  }
}
