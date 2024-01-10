import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
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
        .then((response) {
      print('jaki to $response');
      return response.fold((failure) => Left(failure), (model) {
        print('to jest model $model');
        return Right(ModelConvert(model).toEntityList());
      });
    });
  }
}
