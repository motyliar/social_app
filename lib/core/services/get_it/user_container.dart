import 'package:climbapp/data/friends/datasources/locale/friends_locale_data_sources.dart';
import 'package:climbapp/data/friends/datasources/remote/friends_remote_data_sources.dart';
import 'package:climbapp/data/friends/repository/friends_repository_impl.dart';
import 'package:climbapp/data/message/datasources/remote/message_remote_datasources.dart';
import 'package:climbapp/data/message/repository/message_repository_impl.dart';
import 'package:climbapp/data/notice/datasources/remote/notice_remote_data_sources.dart';
import 'package:climbapp/data/notice/repository/notice_repository_impl.dart';
import 'package:climbapp/data/user/datasources/local/user_local_data_sources.dart';
import 'package:climbapp/data/user/datasources/remote/user_remote_data_sources.dart';
import 'package:climbapp/data/user/repository/user_repository_impl.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';
import 'package:climbapp/domains/friends/usecases/add_friend.dart';
import 'package:climbapp/domains/friends/usecases/delete_friend_usecase.dart';
import 'package:climbapp/domains/friends/usecases/get_friend_usecase.dart';
import 'package:climbapp/domains/friends/usecases/search_users_usecase.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';
import 'package:climbapp/domains/messages/usecases/delete_message_usecase.dart';
import 'package:climbapp/domains/messages/usecases/get_user_messages_usecase.dart';
import 'package:climbapp/domains/messages/usecases/send_message_usecase.dart';
import 'package:climbapp/domains/messages/usecases/update_message_usecase.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/create_new_notice.dart';
import 'package:climbapp/domains/notice/usecases/find_notices_created_by_user.dart';
import 'package:climbapp/domains/notice/usecases/get_notice_pagination_usecase.dart';
import 'package:climbapp/domains/notice/usecases/get_single_notice_usecase.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/update_user_usecase.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_user_notice/create_notice/create_notice_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_user_notice/fetch_user_notice_cubit.dart';
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
    ..registerFactory(() => FriendsActionBloc(
          getFriendUseCase: userLocator(),
          deleteFriendUseCase: userLocator(),
          addFriendUseCase: userLocator(),
          searchUsersUseCase: userLocator(),
        ))
    ..registerFactory(() => MessageActionBloc(
        sendMessageUseCase: userLocator(),
        getUserMessagesUseCase: userLocator(),
        deleteMessageUseCase: userLocator(),
        updateMessageUseCase: userLocator()))
    ..registerFactory(
        () => MessageDeleteCubit(deleteMessageUseCase: userLocator()))
    ..registerFactory(
        () => FetchNoticeBloc(getNoticePaginationUseCase: userLocator()))
    ..registerFactory(
        () => FetchSingleNoticeCubit(getSingleNoticeUseCase: userLocator()))
    ..registerFactory(
        () => CreateNoticeCubit(createNewNoticeUseCase: userLocator()))
    ..registerFactory(() => FetchUserNoticeCubit(fetch: userLocator()))
    // Register every UseCase
    // FRIENDS
    ..registerLazySingleton(
        () => GetFriendUseCase(friendsRepository: userLocator()))
    ..registerLazySingleton(
        () => DeleteFriendUseCase(friendsRepository: userLocator()))
    ..registerLazySingleton(
        () => AddFriendUseCase(friendsRepository: userLocator()))
    ..registerLazySingleton(
        () => SearchUsersUseCase(friendsRepository: userLocator()))

    //USER
    ..registerLazySingleton(() => GetUserUseCase(userLocator()))
    ..registerLazySingleton(
        () => UpdateUserUseCase(userRepository: userLocator()))

    //MESSAGE
    ..registerLazySingleton(
        () => SendMessageUseCase(messagesRepository: userLocator()))
    ..registerLazySingleton(
        () => GetUserMessagesUseCase(messagesRepository: userLocator()))
    ..registerLazySingleton(
        () => DeleteMessageUseCase(messagesRepository: userLocator()))
    ..registerLazySingleton(
        () => UpdateMessageUseCase(messagesRepository: userLocator()))
    // NOTICE
    ..registerLazySingleton(
        () => GetNoticePaginationUseCase(noticeRepository: userLocator()))
    ..registerLazySingleton(
        () => GetSingleNoticeUseCase(noticeRepository: userLocator()))
    ..registerLazySingleton(
        () => CreateNewNoticeUseCase(noticeRepository: userLocator()))
    ..registerLazySingleton(
        () => FindNoticesCreatedByUserUseCase(repository: userLocator()))
    // Register repositories
    // USER
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        userLocalDataSources: userLocator(),
        userRemoteDataSources: userLocator(),
      ),
    )
    // FRIENDS
    ..registerLazySingleton<FriendsRepository>(() => FriendsRepositoryImpl(
        friendsRemoteDataSources: userLocator(),
        friendsLocaleDataSource: userLocator()))
    // MESSAGES
    ..registerLazySingleton<MessagesRepository>(
        () => MessageRepositoryImpl(messageRemoteDataSources: userLocator()))
    //NOTICES
    ..registerLazySingleton<NoticeRepository>(
        () => NoticeRepositoryImpl(noticeRemoteDataSources: userLocator()))

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
        () => FriendsLocalDataSourceImpl())
    // MESSAGES
    ..registerLazySingleton<MessageRemoteDataSources>(
        () => MessageRemoteDataSourcesImpl(client: userLocator()))
    // NOTICES
    ..registerLazySingleton<NoticeRemoteDataSources>(
        () => NoticeRemoteDataSourcesImpl());
}
