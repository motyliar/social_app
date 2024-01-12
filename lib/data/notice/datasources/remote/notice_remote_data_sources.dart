import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_put_data_hanlder.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';

import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/notice/helpers/notice_downloader.dart';
import 'package:climbapp/data/notice/helpers/response_converter.dart';
import 'package:climbapp/data/notice/helpers/status_verifier.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';
import 'package:dartz/dartz.dart';

const String _dataGetter = 'message';
const String _statusGetter = 'status';

abstract class NoticeRemoteDataSources {
  EitherFunc<List<NoticeModel>> getNoticePagination(GetNoticeParams params);
  EitherFunc<NoticeModel> getSingleNotice(GetNoticeParams params);
  EitherFunc<ResponseStatus> createNewNotice(CreateNoticeParams params);
  EitherFunc<List<NoticeModel>> findNoticesCreatedByUser(
      GetNoticeParams params);
  Future<ResponseStatus> updateSingleNotice(UpdateNoticeParams params);
}

class NoticeRemoteDataSourcesImpl extends NoticeRemoteDataSources {
  NoticeRemoteDataSourcesImpl();

  @override
  EitherFunc<List<NoticeModel>> getNoticePagination(
      GetNoticeParams params) async {
    try {
      final responseMap = await NoticeDownloader(params).fetchRawData();
      final convertResponse =
          ToNoticeConverter(responseMap).mapResponseToNoticeList();
      return Right(convertResponse);
    } catch (e) {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<NoticeModel> getSingleNotice(GetNoticeParams params) async {
    try {
      final singleNotice = await NoticeDownloader(params).fetchSingleObject();
      return Right(singleNotice);
    } catch (e) {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<ResponseStatus> createNewNotice(CreateNoticeParams params) async {
    try {
      final response = await NoticeStatusVerifer.startVerify(
              params: params,
              handler: HttpPostDataHandler(params: params),
              dataGetter: _dataGetter)
          .verifyResponse();
      return Right(response);
    } catch (e) {
      return Left(ServerException.failed());
    }
  }

  @override
  EitherFunc<List<NoticeModel>> findNoticesCreatedByUser(
      GetNoticeParams params) async {
    try {
      final responseMap = await NoticeDownloader(params).fetchRawData();
      final convertResponse =
          ToNoticeConverter(responseMap).mapResponseToNoticeList();
      return Right(convertResponse);
    } on ServerException catch (e) {
      Utils.debugError(error: e);
      throw ServerException(e.message);
    }
  }

  @override
  Future<ResponseStatus> updateSingleNotice(UpdateNoticeParams params) async {
    try {
      final response = await NoticeStatusVerifer.startVerify(
              params: params,
              handler: HttpPutDataHandler(params: params),
              dataGetter: _statusGetter)
          .verifyResponse();
      return response;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
