import 'package:climbapp/data/friends/datasources/locale/friends_locale_data_sources.dart';
import 'package:climbapp/data/friends/datasources/remote/friends_remote_data_sources.dart';
import 'package:climbapp/data/friends/repository/friends_repository_impl.dart';
import 'package:climbapp/data/image/repository/image_repository_impl.dart';
import 'package:climbapp/data/image/sources/image_remote.dart';
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
import 'package:climbapp/domains/image/repository/image_repository.dart';
import 'package:climbapp/domains/image/usecase/upload_image_usecase.dart';
import 'package:climbapp/domains/messages/repository/message_repository.dart';
import 'package:climbapp/domains/messages/usecases/delete_message_usecase.dart';
import 'package:climbapp/domains/messages/usecases/get_user_messages_usecase.dart';
import 'package:climbapp/domains/messages/usecases/send_message_usecase.dart';
import 'package:climbapp/domains/messages/usecases/update_message_usecase.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:climbapp/domains/notice/usecases/create_new_notice.dart';
import 'package:climbapp/domains/notice/usecases/create_notice_comment_usecase.dart';
import 'package:climbapp/domains/notice/usecases/delete_single_comment_usecase.dart';
import 'package:climbapp/domains/notice/usecases/delete_user_single_notice_usecase.dart';
import 'package:climbapp/domains/notice/usecases/find_notices_created_by_user.dart';
import 'package:climbapp/domains/notice/usecases/get_filter_notices_by_field.dart';
import 'package:climbapp/domains/notice/usecases/get_notice_pagination_usecase.dart';
import 'package:climbapp/domains/notice/usecases/get_single_notice_usecase.dart';
import 'package:climbapp/domains/notice/usecases/update_comment_usecase.dart';
import 'package:climbapp/domains/notice/usecases/update_user_id_join_arrays_usecase.dart';
import 'package:climbapp/domains/notice/usecases/updated_notice_usecase.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/update_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/updating_user_usecase.dart';
import 'package:climbapp/presentation/create_notice/business/cubit/publish_notice/publish_notice_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/add_comment/add_comment_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/deleteComment/delete_comment_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';

import 'package:climbapp/presentation/notice/business/cubit/create_notice/create_notice_cubit.dart';

import 'package:climbapp/presentation/notice/business/cubit/delete_notice/delete_notice_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_user_notice/fetch_user_notice_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/update_comment/update_comment_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/update_notice/update_notice_cubit.dart';
import 'package:climbapp/presentation/profile/business/cubit/add_to_friend/add_to_friend_cubit.dart';
import 'package:climbapp/presentation/profile/business/cubit/fetch_user/fetch_user_profile_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/image_sender/image_sender_cubit.dart';

import 'package:get_it/get_it.dart';

final userLocator = GetIt.instance;

/// function [userInit] for inject dependecy for [UserBloc], [FriendsActionBloc]
/// every usecase, and repository are implemented [userLocator]
/// function [userInit] are implemented in [bootstrap] to begin
void userInit() {
  userLocator
    // User register factory with every user element
    ..registerFactory(
        () => UserBloc(userLocator(), userLocator(), userLocator()))
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
      () => FetchNoticeBloc(
        getNoticePaginationUseCase: userLocator(),
        updateArrays: userLocator(),
        filterNotices: userLocator(),
      ),
    )
    ..registerFactory(
        () => FetchSingleNoticeCubit(getSingleNoticeUseCase: userLocator()))
    ..registerFactory(
        () => CreateNoticeCubit(createNewNoticeUseCase: userLocator()))
    ..registerFactory(() => UpdateNoticeCubit(updated: userLocator()))
    ..registerFactory(() => PublishNoticeCubit(create: userLocator()))
    ..registerFactory(
      () => FetchUserNoticeCubit(
        fetch: userLocator(),
        delete: userLocator(),
      ),
    )
    ..registerFactory(() => DeleteNoticeCubit(delete: userLocator()))
    ..registerFactory(() => AddCommentCubit(comment: userLocator()))
    ..registerFactory(() => DeleteCommentCubit(deleteComment: userLocator()))
    ..registerFactory(() => UpdateCommentCubit(updateComment: userLocator()))
    ..registerFactory(
        () => FetchUserProfileCubit(getUserUseCase: userLocator()))
    ..registerFactory(() => AddToFriendCubit(
        addFriendUseCase: userLocator(), deleteFriendUseCase: userLocator()))
    ..registerFactory(() => ImageSenderCubit(uploadImageUseCase: userLocator()))
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
    ..registerLazySingleton(
        () => UpdatingUserUseCase(repository: userLocator()))

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
        () => GetFilterNoticesByFieldUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => GetSingleNoticeUseCase(noticeRepository: userLocator()))
    ..registerLazySingleton(
        () => CreateNewNoticeUseCase(noticeRepository: userLocator()))
    ..registerLazySingleton(
        () => FindNoticesCreatedByUserUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => UpdatedNoticeUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => DeleteUserSingleNoticeUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => CreateNoticeCommentUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => DeleteSingleCommentUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => UpdateCommentUseCase(repository: userLocator()))
    ..registerLazySingleton(
        () => UpdateUserIdJoinArraysUseCase(repository: userLocator()))

    //IMAGE
    ..registerLazySingleton(
        () => UploadImageUseCase(imageRepository: userLocator()))
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
    // IMAGE
    ..registerLazySingleton<ImageRepository>(
        () => ImageRepositoryImpl(imageRemoteSource: userLocator()))

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
        () => NoticeRemoteDataSourcesImpl())
    ..registerLazySingleton<ImageRemoteSource>(() => ImageRemoteSourceImpl());
}
