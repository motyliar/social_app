import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';

import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/notice/helpers/notice_downloader.dart';
import 'package:climbapp/data/notice/helpers/response_converter.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';
import 'package:dartz/dartz.dart';

abstract class NoticeRemoteDataSources {
  EitherFunc<List<NoticeModel>> getNoticePagination(GetNoticeParams params);
  EitherFunc<NoticeModel> getSingleNotice(GetNoticeParams params);
  EitherFunc<ResponseStatus> createNewNotice(CreateNoticeParams params);
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
      final resultStatus = await HttpPostDataHandler(params: params)
          .returnData<ResponseStatus>();
      return resultStatus;
    } catch (e) {
      return Left(ServerException.failed());
    }
  }
}
