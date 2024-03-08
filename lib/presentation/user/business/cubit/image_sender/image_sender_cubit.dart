import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/image/usecase/upload_image_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'image_sender_state.dart';

class ImageSenderCubit extends Cubit<ImageSenderState> {
  final UploadImageUseCase _uploadImageUseCase;
  ImageSenderCubit({required UploadImageUseCase uploadImageUseCase})
      : _uploadImageUseCase = uploadImageUseCase,
        super(const ImageSenderState());

  Future<void> sendRequest(ImageParams params) async {
    return await _handleResponse(params);
  }

  Future<void> _handleResponse(ImageParams params) async {
    try {
      return await _sendRequest(params).then((value) => {
            emit(state.copyWith(
              responseMessage: value,
            )),
            debugPrint(value)
          });
    } on ServerException catch (e) {
      debugPrint(e.message);
      emit(ImageSenderFailed());
    }
  }

  Future<void> pickFile(File file) async {
    emit(state.copyWith(imageFile: file));
  }

  Future<String> _sendRequest(ImageParams params) async {
    return _uploadImageUseCase.execute(params).then((value) => value.fold(
        (l) => throw ServerException.message('Bloc catch error'), (r) => r));
  }
}
