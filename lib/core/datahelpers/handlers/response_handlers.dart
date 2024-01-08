import 'package:climbapp/core/utils/utils.dart';
import 'package:http/http.dart';

abstract class IResponseHandler {
  EitherFunc<T> checkStatusCodeAndReturnData<T>(Response response);
}
