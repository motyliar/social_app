// ignore: unused_import
import 'package:climbapp/core/datahelpers/params/requests/requests_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/requests/entities/requests_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RequestsRepository {
  EitherFunc<List<RequestsEntity>> getRequestedUsers(RequestsParams params);
}
