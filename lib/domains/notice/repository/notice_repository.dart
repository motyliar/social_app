import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

abstract class NoticeRepository {
  EitherFunc<List<NoticeEntity>> getNoticePagination(GetNoticeParams params);
  EitherFunc<NoticeEntity> getSingleNotice(GetNoticeParams params);
  EitherFunc<ResponseStatus> createNewNotice(CreateNoticeParams params);
  EitherFunc<List<NoticeEntity>> findNoticesCreatedByUser(
      GetNoticeParams params);
  EitherFunc<ResponseStatus> updateSingleNotice(UpdateNoticeParams params);
  EitherFunc<ResponseStatus> deleteUserSingleNotice(GetNoticeParams params);
  EitherFunc<ResponseStatus> addCommentToNotice(
      CreateNoticeCommentsParams params);
}
