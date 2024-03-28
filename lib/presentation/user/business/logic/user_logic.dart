import 'dart:io';

import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserLogic {
  static Future<File> pickFileFromMobile(ImageSource source,
      {int quality = 5, required BuildContext context}) async {
    final fetchImage = await ImagePicker().pickImage(source: source);
    debugPrint(fetchImage.toString());
    if (fetchImage == null) throw ServerException.error();

    File fetchFile = File(fetchImage.path);
    return fetchFile;
  }
}
