import 'package:climbapp/data/user/datasources/local/user_local_data_sources.dart';
import 'package:climbapp/data/user/datasources/remote/user_remote_data_sources.dart';
import 'package:climbapp/data/user/repository/user_repository_impl.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/update_user_usecase.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:get_it/get_it.dart';

final userLocator = GetIt.instance;

void userInit() {
  userLocator
    ..registerFactory(() => UserBloc(userLocator(), userLocator()))
    ..registerLazySingleton(() => GetUserUseCase(userLocator()))
    ..registerLazySingleton(
        () => UpdateUserUseCase(userRepository: userLocator()))
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        userLocalDataSources: userLocator(),
        userRemoteDataSources: userLocator(),
      ),
    )
    ..registerLazySingleton<UserRemoteDataSources>(
      () => UserRemoteDataSourcesImpl(client: userLocator()),
    )
    ..registerLazySingleton<UserLocalDataSources>(
      () => UserLocalDataSourcesImpl(),
    );
}
