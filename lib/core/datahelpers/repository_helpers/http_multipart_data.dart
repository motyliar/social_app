import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:http/http.dart' as http;

abstract class HttpMultiPartData {
  HttpMultiPartData({required this.params});
  final ImageParams params;
  Future<http.MultipartRequest> sendRequest();
}

class PostMultiPartData extends HttpMultiPartData {
  PostMultiPartData({required super.params});

  @override
  Future<http.MultipartRequest> sendRequest() async {
    final request = http.MultipartRequest('POST', params.url!);
    request.files
        .add(await http.MultipartFile.fromPath('image', params.filePath));
    return request;
  }
}
