import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';

class ToNoticeConverter {
  const ToNoticeConverter(
    List<dynamic> responseList,
  ) : _responseList = responseList;
  final List<dynamic> _responseList;

  List<NoticeModel> mapResponseToNoticeList() {
    return _mapResponseToNoticeList();
  }

  List<NoticeModel> _mapResponseToNoticeList() {
    try {
      final convert =
          _responseList.map((e) => NoticeModel.fromJson(e)).toList();
      return convert;
    } catch (e) {
      throw ServerException.message(e.toString());
    }
  }
}
