import 'dart:convert';
import 'package:climbapp/core/datahelpers/repository_helpers/http_repository_handler.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpPostDataHandler extends HttpRepositoryHandler {
  HttpPostDataHandler({required super.params});

  final http.Client _client = http.Client();
  @override
  Future<Response> getResponseFromServer() async {
    return await _client.post((params.url!),
        body: jsonEncode(params.requestMapBody()), headers: params.headers());
  }
}
