part of 'sports_cubit.dart';

enum SportStatus { success, fail, neutral }

sealed class SportsState extends Equatable {
  const SportsState(
      {this.sports = const <Sport>[],
      this.possibleSport = sportsList,
      this.status = SportStatus.success});
  final List<Sport> sports;
  final List<Sport> possibleSport;
  final SportStatus status;

  @override
  List<Object> get props => [sports, possibleSport, status];
}

final class SportsAction extends SportsState {
  const SportsAction(
      List<Sport> sports, List<Sport> possibleSport, SportStatus status)
      : super(sports: sports, possibleSport: possibleSport, status: status);

  SportsAction copyWith(List<Sport>? sports, List<Sport>? possibleSport,
          SportStatus? status) =>
      SportsAction(sports ?? this.sports, possibleSport ?? this.possibleSport,
          status ?? this.status);
}
