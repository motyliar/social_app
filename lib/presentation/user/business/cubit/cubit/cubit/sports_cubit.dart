import 'package:bloc/bloc.dart';
import 'package:climbapp/presentation/user/view/subview/sports.dart';

import 'package:equatable/equatable.dart';

part 'sports_state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit()
      : super(const SportsAction(<Sport>[], sportsList, SportStatus.success));

  void addSportToFavorite(Sport sport) {
    final state = this.state as SportsAction;
    if (state.sports.length < 4) {
      emit(state.copyWith(List.from(state.sports)..add(sport),
          List.from(state.possibleSport)..remove(sport), state.status));
    } else {
      emit(state.copyWith(state.sports, state.possibleSport, SportStatus.fail));
    }
  }

  void removeSportFromFavorite(Sport sport) {
    final state = this.state as SportsAction;
    emit(state.copyWith(List.from(state.sports)..remove(sport),
        List.from(state.possibleSport)..add(sport), state.status));
  }

  void restartStatusToNeutral() {
    emit(SportsAction(state.sports, state.possibleSport, SportStatus.neutral));
  }
}
