import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_get_data_handler.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';

class NoticeDownloader extends RepositoryDownloader<GetNoticeParams> {
  NoticeDownloader(super.params);

  Future<NoticeModel> fetchSingleObject() async {
    print('ropoczyna sie notice downloader');
    return await HttpGetDataHandler(params: _params).returnData().then(
        (response) => response.fold(
            (f) => throw f, (data) => NoticeModel.fromJson(data)));
  }

  @override
  Future<List<dynamic>> fetchRawData() async {
    final response =
        await HttpGetDataHandler(params: _params).returnData<List<dynamic>>();

    return response.fold(
        (failure) => throw ServerException.parseData(), (data) => data);
  }
}

abstract class RepositoryDownloader<E> {
  const RepositoryDownloader(E params) : _params = params;
  final E _params;

  Future<List<dynamic>> fetchRawData();
}
