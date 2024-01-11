import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';

class GetNoticeParams extends RepositoryParams {
  const GetNoticeParams({
    this.noticeId,
    required super.url,
  });
  final String? noticeId;

  @override
  Map<String, dynamic> requestMapBody() => {};
}

class CreateNoticeParams extends RepositoryParams {
  CreateNoticeParams._({required Uri url, required NoticeEntity notice})
      : _notice = notice,
        super(url: url);
  final NoticeEntity _notice;

  factory CreateNoticeParams.send(Uri url, NoticeEntity notice) =>
      CreateNoticeParams._(url: url, notice: notice);
  @override
  Map<String, dynamic> requestMapBody() => {
        "notice": {
          "author": _notice.author,
          "authorId": _notice.authorId,
          "category": _notice.category,
          "content": {
            "title": _notice.content.title,
            "content": _notice.content.content,
            "price": _notice.content.price ?? 0
          }
        }
      };
}
