import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';

abstract class NoticeRemoteDataSources {
  EitherFunc<List<NoticeModel>> getNoticePagination(GetNoticeParams params);
}

class NoticeRemoteDataSourcesImpl extends NoticeRemoteDataSources {
  NoticeRemoteDataSourcesImpl();

  @override
  EitherFunc<List<NoticeModel>> getNoticePagination(
      GetNoticeParams params) async {
    return await HttpPostDataHandler(params: params).returnData();
  }
}
