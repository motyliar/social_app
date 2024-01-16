import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/repository_helpers/http_repository_handler.dart';
import 'package:climbapp/core/datahelpers/status_service/verify_status.dart';

class NoticeStatusVerifer extends IStatusVerifier<CreateNoticeParams> {
  NoticeStatusVerifer._(
      {required HttpRepositoryHandler handler, String? dataGetter})
      : _dataGetter = dataGetter,
        _handler = handler;

  final String? _dataGetter;
  final HttpRepositoryHandler _handler;

  factory NoticeStatusVerifer.startVerify(
          {required HttpRepositoryHandler handler, String? dataGetter}) =>
      NoticeStatusVerifer._(handler: handler, dataGetter: dataGetter);

  @override
  Future<String> fetchResponseDescription_() async {
    return await _handler
        .returnData<String>(dataGetter: _dataGetter)
        .then((response) => response.fold((f) => throw f, (data) => data));
  }
}
