part of 'sports_cubit.dart';

enum SportStatus { success, fail, neutral, rebuild }

sealed class SportsState extends Equatable {
  const SportsState(
      {required this.sports,
      this.possibleSport = const <Sport>[],
      this.status = SportStatus.success});
  final SportsList sports;
  final List<Sport> possibleSport;
  final SportStatus status;

  @override
  List<Object> get props => [sports, possibleSport, status];
}

class SportsAction extends SportsState {
  const SportsAction(
      {required super.sports,
      required super.possibleSport,
      required super.status});

  SportsAction copyWith(
          {SportsList? sports,
          List<Sport>? possibleSport,
          SportStatus? status}) =>
      SportsAction(
          sports: sports ?? this.sports,
          possibleSport: possibleSport ?? this.possibleSport,
          status: status ?? this.status);

  @override
  List<Object> get props => [sports, possibleSport, status];
}
