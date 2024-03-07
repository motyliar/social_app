import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class ImageParams extends RepositoryParams {
  const ImageParams({required this.filePath, required this.userId, super.url});
  final String filePath;
  final String userId;

  @override
  Map<String, dynamic> requestMapBody() => {};
}
