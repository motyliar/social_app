import 'package:climbapp/data/password/datasources/password_remote_data_sources.dart';
import 'package:climbapp/data/password/repository/password_repository_impl.dart';
import 'package:climbapp/domains/password/repository/password_repository.dart';
import 'package:climbapp/domains/password/usecases/change_password_usecase.dart';
import 'package:climbapp/domains/password/usecases/new_password_usecase.dart';
import 'package:climbapp/presentation/password/business/cubit/password_cubit.dart';
import 'package:get_it/get_it.dart';

final passwordLocator = GetIt.instance;

void passwordInit() {
  passwordLocator
    ..registerFactory(
      () => PasswordCubit(
        changePasswordUseCase: passwordLocator(),
        forgotPasswordUseCase: passwordLocator(),
      ),
    )
    ..registerLazySingleton(() => ChangePasswordUseCase(passwordLocator()))
    ..registerLazySingleton(() => ForgotPasswordUseCase(passwordLocator()))
    ..registerLazySingleton<PasswordRepository>(
      () => PasswordRepositoryImpl(passwordLocator()),
    )
    ..registerLazySingleton<PasswordRemoteDataSources>(
      PasswordRemoteDataSourcesImpl.new,
    );
}
