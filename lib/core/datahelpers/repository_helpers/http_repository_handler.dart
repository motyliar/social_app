import 'package:climbapp/core/datahelpers/handlers/response_handlers.impl.dart';
import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:http/http.dart';

abstract class HttpRepositoryHandler {
  const HttpRepositoryHandler({required this.params});
  final RepositoryParams params;

  Future<Response> getResponseFromServer();

  Future<Response> sendRequest() async {
    return await getResponseFromServer();
  }

  EitherFunc<T> returnData<T>() async {
    final response = await sendRequest();
    print(response.body);
    return _handleResponse<T>(response);
  }

  EitherFunc<T> _handleResponse<T>(Response response) async {
    final handler = ResponseHandler();
    return handler.checkStatusCodeAndReturnData(response);
  }
}
