import 'package:climbapp/data/sign_in/datasources/sign_in_remote_data.dart';
import 'package:climbapp/data/sign_in/repository/sign_in_repository_impl.dart';
import 'package:climbapp/domains/sign_in/repository/sign_in_repository.dart';
import 'package:climbapp/domains/sign_in/usecases/catch_user_token_usecase.dart';
import 'package:climbapp/domains/sign_in/usecases/log_out_usecase.dart';
import 'package:climbapp/domains/sign_in/usecases/sign_in_usecase.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';

final loginLocator = GetIt.instance;

void signInInit() {
  loginLocator
    ..registerFactory(
      () => SignInBloc(
        signInUseCase: loginLocator<SignInUseCase>(),
        logOutUseCase: loginLocator<LogOutUseCase>(),
        catchUserTokenUsecase: loginLocator<CatchUserTokenUsecase>(),
      ),
    )
    ..registerLazySingleton(() => SignInUseCase(loginLocator()))
    ..registerLazySingleton(() => LogOutUseCase(loginLocator()))
    ..registerLazySingleton(
      () => CatchUserTokenUsecase(
        signInRepository: loginLocator(),
      ),
    )
    ..registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(loginLocator()),
    )
    ..registerLazySingleton<SignInRemoteDataSources>(
      () => SignInRemoteDataSourcesImpl(client: loginLocator()),
    );
}
