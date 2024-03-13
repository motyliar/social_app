import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:climbapp/domains/sports/entities/structure/sport_map.dart';
import 'package:climbapp/domains/sports/usecases/get_user_sports.dart';
import 'package:climbapp/domains/sports/usecases/update_user_sports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'load_sport_state.dart';

class LoadSportCubit extends Cubit<LoadSportState> {
  final GetUserFavouriteSportsUseCase _getSports;
  final UpdateSportsUseCase _updateSports;
  LoadSportCubit(
      {required GetUserFavouriteSportsUseCase getSports,
      required UpdateSportsUseCase updateSports})
      : _getSports = getSports,
        _updateSports = updateSports,
        super(LoadSportLoading(sports: SportMap()));

  Future<void> getUserSports(GetSportParams params) async {
    return await _handleResponse(params);
  }

  Future<void> updateSportData(UpdateSportParams params) async {
    return await _updateSportData(params);
  }

  void changeSportValue(String name, {int value = 1}) {
    return _changeSportValue(name, value);
  }

  Future<void> _handleResponse(GetSportParams params) async {
    try {
      await _getUserSports(params).then(
        (sport) => emit(LoadSportState(sports: state.sports.fetchData(sport))),
      );
    } on ServerException {
      emit(LoadSportFailed(sports: state.sports));
    }
  }

  Future<SportEntity> _getUserSports(GetSportParams params) async {
    return await _getSports.execute(params).then((response) => response.fold(
        (l) => throw ServerException(l.toString()), (sport) => sport));
  }

  Future<void> _updateSportData(UpdateSportParams params) async {
    try {
      final response = await _getResponseFromUpdate(params);
      debugPrint(response);
      emit(LoadSportState(sports: state.sports));
    } catch (e) {
      emit(LoadSportFailed(sports: state.sports));
    }
  }

  Future<String> _getResponseFromUpdate(UpdateSportParams params) async {
    return await _updateSports
        .execute(params)
        .then((response) => response.fold((l) => throw l, (data) => data));
  }

  void _changeSportValue(String name, int value) {
    emit(LoadSportLoading(sports: state.sports));
    emit(state.copyWith(sports: state.sports.update(value, name)));
    debugPrint(state.sports.toString());
  }
}
