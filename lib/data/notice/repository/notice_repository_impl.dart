import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/notice/datasources/remote/notice_remote_data_sources.dart';
import 'package:climbapp/data/notice/helpers/to_notice_convert.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/repository/notice_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class NoticeRepositoryImpl extends NoticeRepository {
  NoticeRepositoryImpl(
      {required NoticeRemoteDataSources noticeRemoteDataSources})
      : _noticeRemoteDataSources = noticeRemoteDataSources;
  final NoticeRemoteDataSources _noticeRemoteDataSources;

  @override
  EitherFunc<List<NoticeEntity>> getNoticePagination(
      GetNoticeParams params) async {
    return await Utils()
        .performNetworkOperation<List<NoticeModel>>(() async =>
            await _noticeRemoteDataSources.getNoticePagination(params))
        .then((response) => response.fold((failure) => Left(failure),
            (model) => Right(ModelConvert(model).toEntityList())));
  }

  @override
  EitherFunc<NoticeEntity> getSingleNotice(GetNoticeParams params) async {
    try {
      return await Utils()
          .performNetworkOperation<NoticeModel>(() async =>
              await _noticeRemoteDataSources.getSingleNotice(params))
          .then((response) => response.fold(
              (failure) => Left(failure), (data) => Right(data.toEntity())));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  EitherFunc<ResponseStatus> createNewNotice(CreateNoticeParams params) async {
    try {
      return await Utils().performNetworkOperation<ResponseStatus>(() async =>
          await _noticeRemoteDataSources.createNewNotice(params).then(
              (response) => response.fold(
                  (failure) => Left(failure), (data) => Right(data))));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  EitherFunc<List<NoticeEntity>> findNoticesCreatedByUser(
      GetNoticeParams params) async {
    try {
      return await Utils().performNetworkOperation<List<NoticeEntity>>(
          () async => await _noticeRemoteDataSources
              .findNoticesCreatedByUser(params)
              .then((response) => response.fold((failure) => Left(failure),
                  (model) => Right(ModelConvert(model).toEntityList()))));
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  EitherFunc<ResponseStatus> updateSingleNotice(
      UpdateNoticeParams params) async {
    try {
      return await Utils().performNetworkOperation<ResponseStatus>(() async =>
          await _noticeRemoteDataSources
              .updateSingleNotice(params)
              .then((response) => Right(response)));
    } on ServerException catch (e) {
      return Left(ServerException(e.message));
    }
  }

  @override
  EitherFunc<ResponseStatus> deleteUserSingleNotice(
      GetNoticeParams params) async {
    try {
      return await Utils().performNetworkOperation<ResponseStatus>(() async =>
          await _noticeRemoteDataSources
              .deleteUserSingleNotice(params)
              .then((response) => Right(response)));
    } on ServerException catch (e) {
      return Left(ServerException(e.message));
    }
  }

  @override
  EitherFunc<ResponseStatus> addCommentToNotice(
      CreateNoticeCommentsParams params) async {
    try {
      return await Utils().performNetworkOperation<ResponseStatus>(() async =>
          await _noticeRemoteDataSources
              .addCommentToNotice(params)
              .then((response) => Right(response)));
    } on ServerException catch (e) {
      return Left(ServerException(e.message));
    }
  }
}
