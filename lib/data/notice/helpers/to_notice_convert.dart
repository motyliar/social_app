import 'package:climbapp/data/notice/models/notice_model.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';

class ModelConvert {
  const ModelConvert(List<NoticeModel> noticeModel)
      : _noticeModel = noticeModel;
  final List<NoticeModel> _noticeModel;

  List<NoticeEntity> toEntityList() {
    return _noticeModel.map((e) => e.toEntity()).toList();
  }
}
