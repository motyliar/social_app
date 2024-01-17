import 'package:climbapp/data/onBoard/local/on_board_local.dart';
import 'package:climbapp/data/onBoard/repository/on_board_repository_impl.dart';
import 'package:climbapp/domains/onBoard/repository/on_board_repository.dart';
import 'package:climbapp/domains/onBoard/usecase/change_open_status_usecase.dart';
import 'package:climbapp/domains/onBoard/usecase/get_open_status_usecase.dart';
import 'package:climbapp/presentation/on_board/business/firstOpen/first_open_cubit.dart';
import 'package:get_it/get_it.dart';

final preLocator = GetIt.instance;

void preAppInit() {
  preLocator
    ..registerFactory(() =>
        FirstOpenCubit(getStatus: preLocator(), changeStatus: preLocator()))
    ..registerLazySingleton(
        () => GetOpenStatusUseCase(onBoardRepository: preLocator()))
    ..registerLazySingleton(
        () => ChangeOpenStatusUseCase(onBoard: preLocator()))
    ..registerLazySingleton<OnBoardRepository>(
        () => OnBoardRepositoryImpl(local: preLocator()))
    ..registerLazySingleton<OnBoardLocalSources>(() => OnBoardLocalImpl());
}
