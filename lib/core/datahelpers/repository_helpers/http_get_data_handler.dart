import 'package:climbapp/core/datahelpers/repository_helpers/http_repository_handler.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpGetDataHandler extends HttpRepositoryHandler {
  HttpGetDataHandler({required super.params});

  final http.Client _client = http.Client();

  @override
  Future<Response> getResponseFromServer() async {
    return await _client.get((params.url!), headers: params.headers());
  }
}
