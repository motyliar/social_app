import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/image/sources/image_remote.dart';
import 'package:climbapp/domains/image/repository/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ImageRepositoryImpl extends ImageRepository {
  ImageRepositoryImpl({required ImageRemoteSource imageRemoteSource})
      : _imageRemoteSource = imageRemoteSource;
  final ImageRemoteSource _imageRemoteSource;

  @override
  EitherFunc<String> uploadImageToServer(ImageParams params) async {
    try {
      return await _imageRemoteSource
          .uploadImageToServer(params)
          .then((value) => Right(value));
    } on ServerException catch (e) {
      debugPrint('repository impl error: ${e.toString()}');

      return Left(ServerException.error());
    }
  }
}
