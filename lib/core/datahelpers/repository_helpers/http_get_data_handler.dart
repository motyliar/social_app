import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_repository_handler.dart';
import 'package:climbapp/core/utils/utils.dart';

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

EitherFunc<String> getMessage(RepositoryParams params) async {
  return HttpGetDataHandler(params: params).returnData();
}
