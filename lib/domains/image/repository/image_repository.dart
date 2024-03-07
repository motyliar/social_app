import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';

abstract class ImageRepository {
  EitherFunc<String> uploadImageToServer(ImageParams params);
}
