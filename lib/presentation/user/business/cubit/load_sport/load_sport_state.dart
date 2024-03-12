part of 'load_sport_cubit.dart';

class LoadSportState extends Equatable {
  const LoadSportState({this.sports});
  final SportEntity? sports;

  @override
  List<Object?> get props => [sports];
}

final class LoadSportLoading extends LoadSportState {}

class LoadSportFailed extends LoadSportState {}
