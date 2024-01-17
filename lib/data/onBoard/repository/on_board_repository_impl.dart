import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/onBoard/local/on_board_local.dart';
import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';
import 'package:climbapp/domains/onBoard/repository/on_board_repository.dart';
import 'package:dartz/dartz.dart';

class OnBoardRepositoryImpl extends OnBoardRepository {
  OnBoardRepositoryImpl({required OnBoardLocalSources local}) : _local = local;
  final OnBoardLocalSources _local;

  @override
  EitherFunc<OnBoardEntity> getOpenStatus() async {
    try {
      return _local.getOpenStatus().then((value) => Right(value.toEntity()));
    } catch (e) {
      return Left(HiveExceptions.emptyData());
    }
  }

  @override
  EitherFunc<ResponseStatus> changeOpenStatus() async {
    try {
      return _local.changeOpenStatus().then((value) => Right(value));
    } on HiveExceptions catch (e) {
      return Left(HiveExceptions.emptyData());
    }
  }
}
