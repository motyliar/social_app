import 'package:climbapp/data/friends/datasources/locale/friends_locale_data_sources.dart';
import 'package:climbapp/data/friends/datasources/remote/friends_remote_data_sources.dart';
import 'package:climbapp/data/friends/repository/friends_repository_impl.dart';
import 'package:climbapp/data/user/datasources/local/user_local_data_sources.dart';
import 'package:climbapp/data/user/datasources/remote/user_remote_data_sources.dart';
import 'package:climbapp/data/user/repository/user_repository_impl.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';
import 'package:climbapp/domains/friends/usecases/get_friend_usecase.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/update_user_usecase.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:get_it/get_it.dart';

final userLocator = GetIt.instance;

/// function [userInit] for inject dependecy for [UserBloc], [FriendsActionBloc]
/// every usecase, and repository are implemented [userLocator]
/// function [userInit] are implemented in [bootstrap] to begin
void userInit() {
  userLocator
    // User register factory with every user element
    ..registerFactory(() => UserBloc(userLocator(), userLocator()))
    ..registerFactory(() => FriendsActionBloc(getFriendUseCase: userLocator()))
    // Register every UseCase
    // FRIENDS
    ..registerLazySingleton(
        () => GetFriendUseCase(friendsRepository: userLocator()))
    //USER
    ..registerLazySingleton(() => GetUserUseCase(userLocator()))
    ..registerLazySingleton(
        () => UpdateUserUseCase(userRepository: userLocator()))
    // Register repositories
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        userLocalDataSources: userLocator(),
        userRemoteDataSources: userLocator(),
      ),
    )
    ..registerLazySingleton<FriendsRepository>(() => FriendsRepositoryImpl(
        friendsRemoteDataSources: userLocator(),
        friendsLocaleDataSource: userLocator()))
    // Register Remote and Local Data
    //USER
    ..registerLazySingleton<UserRemoteDataSources>(
      () => UserRemoteDataSourcesImpl(client: userLocator()),
    )
    ..registerLazySingleton<UserLocalDataSources>(
      () => UserLocalDataSourcesImpl(),
    )
    // FRIENDS
    ..registerLazySingleton<FriendsRemoteDataSources>(
        () => FriendsRemoteDataSourcesImpl(client: userLocator()))
    ..registerLazySingleton<FriendsLocaleDataSource>(
        () => FriendsLocalDataSourceImpl());
}
