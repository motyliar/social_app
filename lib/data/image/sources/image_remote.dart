import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
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
      final request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://65.21.202.169:20119/up/upload?file=${params.userId}'));
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        params.filePath,
      ));
      var response = await request.send();
      final responseBody = await response.stream.bytesToString();
      debugPrint(responseBody);

      return '';
    } on ServerException catch (e) {
      debugPrint(e.toString());
    }
    throw ServerException.error();
  }
}
