import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/data/onBoard/local/on_board_local.dart';
import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';
import 'package:climbapp/domains/onBoard/repository/on_board_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

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
  EitherFunc<ResponseStatus> changeOpenStatus(OnBoardParam param) async {
    try {
      return _local.changeOpenStatus(param).then((value) => Right(value));
    } on HiveExceptions catch (e) {
      debugPrint(e.toString());
      return Left(HiveExceptions.emptyData());
    }
  }
}

// todo
// dodać wartość bool - true or false w zależności czy będzie logowanie czy wylogowanie
// zaimplementować teraz buissnes i wsadzić to do on board screen i przetestować
