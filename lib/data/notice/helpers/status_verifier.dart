import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_post_data_handler.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/datahelpers/status_service/verify_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';

class NoticeStatusVerifer extends IStatusVerifier<CreateNoticeParams> {
  NoticeStatusVerifer._({required RepositoryParams params, String? dataGetter})
      : _params = params,
        _dataGetter = dataGetter;
  final RepositoryParams _params;
  final String? _dataGetter;

  factory NoticeStatusVerifer.startVerify(
          {required RepositoryParams params, String? dataGetter}) =>
      NoticeStatusVerifer._(params: params, dataGetter: dataGetter);

  @override
  Future<String> fetchResponseDescription_() async {
    return await HttpPostDataHandler(params: _params)
        .returnData<String>(dataGetter: _dataGetter)
        .then((response) => response.fold((f) => throw f, (data) => data));
  }
}
