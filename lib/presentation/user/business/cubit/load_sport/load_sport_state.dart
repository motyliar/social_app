part of 'load_sport_cubit.dart';

class LoadSportState extends Equatable {
  const LoadSportState({required this.sports});
  final SportMap sports;

  LoadSportState copyWith({SportMap? sports}) =>
      LoadSportState(sports: sports ?? this.sports);

  @override
  List<Object?> get props => [sports];
}

final class LoadSportLoading extends LoadSportState {
  const LoadSportLoading({required super.sports});
}

class LoadSportFailed extends LoadSportState {
  const LoadSportFailed({required super.sports});
}
