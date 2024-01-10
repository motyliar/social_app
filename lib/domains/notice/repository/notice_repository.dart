import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NoticeRepository {
  EitherFunc<List<NoticeEntity>> getNoticePagination(GetNoticeParams params);
}
