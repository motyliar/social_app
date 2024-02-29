import 'package:bloc/bloc.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:climbapp/presentation/user/view/subview/sports.dart';

import 'package:equatable/equatable.dart';

part 'sports_state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit()
      : super(SportsAction(
            sports: SportsList(sports: const <Sport>[]),
            possibleSport: sportsList,
            status: SportStatus.success));

  void addSportToFavorite(Sport sport) {
    final state = this.state as SportsAction;
    if (state.sports.sports.length < 4) {
      emit(state.copyWith(
          sports:
              SportsList(sports: List.from(state.sports.sports)..add(sport)),
          possibleSport: List.from(state.possibleSport)..remove(sport),
          status: SportStatus.rebuild));
    } else {
      emit(state.copyWith(status: SportStatus.fail));
    }
  }

  void removeSportFromFavorite(Sport sport) {
    final state = this.state as SportsAction;
    emit(state.copyWith(
        sports:
            SportsList(sports: List.from(state.sports.sports)..remove(sport)),
        possibleSport: List.from(state.possibleSport)..add(sport),
        status: SportStatus.rebuild));
  }

  void restartStatusToNeutral() {
    final state = this.state as SportsAction;
    emit(state.copyWith(status: SportStatus.neutral));
  }

  void incrementRateOfEachSport(int index, int value) async {
    final state = this.state as SportsAction;
    final sport = List.of(state.sports.sports);
    sport[index].value = value + 1;

    emit(state.copyWith(
        sports: SportsList(sports: sport), status: SportStatus.rebuild));
  }

  // void decrementRateOfEachSport(int index) {
  //   final state = this.state as SportsAction;
  //   final listOfSport = state.sports;
  //   listOfSport[index].copyWith(value: listOfSport[index].value - 1);
  //   emit(state.copyWith(sports: List.from(listOfSport)));
  // }
}
