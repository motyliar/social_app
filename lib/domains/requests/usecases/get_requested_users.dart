import 'package:climbapp/core/datahelpers/params/requests/requests_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/requests/entities/requests_entity.dart';
import 'package:climbapp/domains/requests/repository/request_repository.dart';

class GetRequestedUseresUseCase
    extends IUseCase<RequestsRepository, List<RequestsEntity>, RequestsParams> {
  GetRequestedUseresUseCase({required super.repository});

  @override
  EitherFunc<List<RequestsEntity>> execute(RequestsParams params) {
    return repository_.getRequestedUsers(params);
  }
}
