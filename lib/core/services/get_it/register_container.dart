import 'package:climbapp/data/register/datasources/register_remote_data.dart';
import 'package:climbapp/data/register/repository/register_repository_impl.dart';
import 'package:climbapp/domains/register/repository/register_repository.dart';
import 'package:climbapp/domains/register/usecases/create_db_user_usecase.dart';
import 'package:climbapp/domains/register/usecases/create_new_firebase_user.dart';
import 'package:climbapp/presentation/register/business/bloc/user_register/user_register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final registerLocator = GetIt.instance;
bool _isRegisterCalled = false;

void registerInit() {
  if (_isRegisterCalled) {
    return;
  } else {
    registerLocator

      // Register Factory [UserRegisterBloc], adding context for Localizations
      ..registerFactory(
        () => UserRegisterBloc(
          registerLocator<CreateDBUserUsecase>(),
          registerLocator<CreateNewFirebaseUserUsecase>(),
        ),
      )

      /// Register UseCases for BLoC
      ..registerLazySingleton(() => CreateDBUserUsecase(registerLocator()))
      ..registerLazySingleton(
        () => CreateNewFirebaseUserUsecase(registerLocator()),
      )

      /// Register Repositiory and Repository Implementation
      ..registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(registerLocator()),
      )
      // Register Remote Data Sources for Repository
      ..registerLazySingleton<RegisterRemoteDataSources>(
        () => RegisterRemoteDataSourcesImpl(client: registerLocator()),
      )
      // http Client
      ..registerLazySingleton(() => http.Client());

    _isRegisterCalled = true;
  }
}
