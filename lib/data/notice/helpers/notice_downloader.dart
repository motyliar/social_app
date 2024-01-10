import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';

class NoticeDownloader extends RepositoryDownloader<GetNoticeParams> {
  NoticeDownloader(super.params);

  @override
  Future<List<dynamic>> fetchRawData() async {
    return await HttpGetDataHandler(params: _params)
        .returnData<List<dynamic>>()
        .then((response) =>
            response.fold((failure) => throw failure, (data) => data));
  }
}

abstract class RepositoryDownloader<E> {
  const RepositoryDownloader(E params) : _params = params;
  final E _params;

  Future<List<dynamic>> fetchRawData();
}
