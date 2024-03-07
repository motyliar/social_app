import 'dart:io';

import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserLogic {
  static Future<File> pickFileFromMobile(ImageSource source,
      {int quality = 5, required BuildContext context}) async {
    final fetchImage = await ImagePicker().pickImage(source: source);
    if (fetchImage == null) throw ServerException.error();
    // final bytes = await FlutterImageCompress.compressWithFile(fetchImage.path,
    //     quality: quality);
    // final base64String = base64Encode(Uint8List.fromList(bytes!));
    File fetchFile = File(fetchImage.path);
    return fetchFile;
  }
}
