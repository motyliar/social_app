// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climbapp/core/datahelpers/params/repository_params.dart';

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
  CreateNoticeParams._({required Uri url, required NoticeTemplate notice})
      : _notice = notice,
        super(url: url);
  final NoticeTemplate _notice;

  factory CreateNoticeParams.send(Uri url, NoticeTemplate notice) =>
      CreateNoticeParams._(url: url, notice: notice);
  @override
  Map<String, dynamic> requestMapBody() => {
        "notice": {
          "author": _notice.author,
          "authorId": _notice.authorId,
          "category": _notice.category,
          "content": {
            "title": _notice.title,
            "content": _notice.content,
            "price": _notice.price ?? 0
          }
        }
      };
}

class UpdateNoticeParams<T> extends RepositoryParams {
  UpdateNoticeParams({
    required this.field,
    required this.update,
    required super.url,
  });
  final String field;
  final T update;
  @override
  Map<String, dynamic> requestMapBody() => {"field": field, "content": update};
}

class NoticeTemplate {
  final String author;
  final String authorId;
  final String category;
  final String title;
  final String content;
  final int? price;
  NoticeTemplate({
    required this.author,
    required this.authorId,
    required this.category,
    required this.title,
    required this.content,
    this.price,
  });
}
