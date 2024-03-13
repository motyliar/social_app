import 'package:climbapp/data/sport/datasources/remote/sport_remote.dart';
import 'package:climbapp/data/sport/repository/sport_repository_impl.dart';
import 'package:climbapp/domains/sports/repository/sports_repository.dart';
import 'package:climbapp/domains/sports/usecases/get_user_sports.dart';
import 'package:climbapp/domains/sports/usecases/update_user_sports.dart';
import 'package:climbapp/presentation/user/business/cubit/load_sport/load_sport_cubit.dart';
import 'package:get_it/get_it.dart';

final sportLocator = GetIt.instance;

void sportInit() {
  sportLocator
    ..registerFactory(() =>
        LoadSportCubit(getSports: sportLocator(), updateSports: sportLocator()))

    // USECASEs
    ..registerLazySingleton(
        () => GetUserFavouriteSportsUseCase(repository: sportLocator()))
    ..registerLazySingleton(
        () => UpdateSportsUseCase(repository: sportLocator()))

    // REPOSITORY
    ..registerLazySingleton<SportsRepository>(
        () => SportRepositoryImpl(remote: sportLocator()))
    ..registerLazySingleton<ISportRemoteSource>(() => SportRemoteSourceImpl());
}
