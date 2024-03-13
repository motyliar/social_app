import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:climbapp/domains/sports/entities/structure/sport_map.dart';
import 'package:climbapp/domains/sports/usecases/get_user_sports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'load_sport_state.dart';

class LoadSportCubit extends Cubit<LoadSportState> {
  final GetUserFavouriteSportsUseCase _getSports;
  LoadSportCubit({required GetUserFavouriteSportsUseCase getSports})
      : _getSports = getSports,
        super(LoadSportLoading(sports: SportMap()));
  Future<void> getUserSports(GetSportParams params) async {
    return await _handleResponse(params);
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

  void changeSportValue(String name, {int value = 1}) {
    emit(LoadSportLoading(sports: state.sports));
    emit(state.copyWith(sports: state.sports.update(value, name)));
    debugPrint(state.sports.toString());
  }
}
