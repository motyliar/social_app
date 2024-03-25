import 'package:climbapp/core/datahelpers/params/requests/requests_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/requests/datasources/remote/request_remote_source.dart';
import 'package:climbapp/domains/requests/entities/requests_entity.dart';
import 'package:climbapp/domains/requests/repository/request_repository.dart';
import 'package:dartz/dartz.dart';

class RequestRepositoryImpl extends RequestsRepository {
  RequestRepositoryImpl({required IRequestDataSource remote})
      : _remote = remote;
  final IRequestDataSource _remote;

  @override
  EitherFunc<List<RequestsEntity>> getRequestedUsers(
      RequestsParams params) async {
    try {
      return await Utils().performNetworkOperation(() async => await _remote
          .getRequestedUsers(params)
          .then((value) => Right(value.map((e) => e.toEntity()).toList())));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException.message(e.toString()));
    }
  }
}
