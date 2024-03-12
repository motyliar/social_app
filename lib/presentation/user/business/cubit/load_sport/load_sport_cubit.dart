import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:climbapp/domains/sports/usecases/get_user_sports.dart';
import 'package:equatable/equatable.dart';

part 'load_sport_state.dart';

class LoadSportCubit extends Cubit<LoadSportState> {
  final GetUserFavouriteSportsUseCase _getSports;
  LoadSportCubit({required GetUserFavouriteSportsUseCase getSports})
      : _getSports = getSports,
        super(LoadSportLoading());
  Future<void> getUserSports(GetSportParams params) async {
    return await _handleResponse(params);
  }

  Future<void> _handleResponse(GetSportParams params) async {
    try {
      await _getUserSports(params)
          .then((sport) => emit(LoadSportState(sports: sport)));
    } on ServerException {
      emit(LoadSportFailed());
    }
  }

  Future<SportEntity> _getUserSports(GetSportParams params) async {
    return await _getSports.execute(params).then((response) => response.fold(
        (l) => throw ServerException(l.toString()), (sport) => sport));
  }
}
