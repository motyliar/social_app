import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/image/repository/image_repository.dart';

class UploadImageUseCase {
  UploadImageUseCase({required ImageRepository imageRepository})
      : _imageRepository = imageRepository;
  final ImageRepository _imageRepository;

  EitherFunc<String> execute(ImageParams params) {
    return _imageRepository.uploadImageToServer(params);
  }
}
