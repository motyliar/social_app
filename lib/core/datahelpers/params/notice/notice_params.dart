// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/directions.dart';

class GetNoticeParams extends RepositoryParams {
  const GetNoticeParams({
    this.noticeId,
    required super.url,
  });
  final String? noticeId;

  @override
  Map<String, dynamic> requestMapBody() => {"noticeId": noticeId};
}

class CreateNoticeParams extends RepositoryParams {
  CreateNoticeParams._({required Uri url, required this.newNotice})
      : super(url: url);

  final Map<String, dynamic> newNotice;

  factory CreateNoticeParams.send(Uri url, Map<String, dynamic> newNotice) =>
      CreateNoticeParams._(url: url, newNotice: newNotice);
  @override
  Map<String, dynamic> requestMapBody() => newNotice;
}

class CreateNoticeCommentsParams extends RepositoryParams {
  CreateNoticeCommentsParams({required CommentTemplate comment, super.url})
      : _comment = comment;
  final CommentTemplate _comment;

  @override
  Map<String, dynamic> requestMapBody() => {
        "comment": {
          "user": _comment.user,
          "userId": _comment.userId,
          "content": _comment.content
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

class UpdateCommentParams extends RepositoryParams {
  UpdateCommentParams(
      {required this.commentId, required this.newContent, required super.url});
  final String commentId;
  final String newContent;

  @override
  Map<String, dynamic> requestMapBody() =>
      {"commentId": commentId, "newContent": newContent};
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

class CommentTemplate {
  const CommentTemplate(
      {required this.user, required this.userId, required this.content});
  final String user;
  final String userId;
  final String content;
}

class UpdateRequestJoinParams extends RepositoryParams {
  const UpdateRequestJoinParams(
      {required this.userId,
      required this.noticeId,
      required this.direction,
      super.url});

  final String userId;
  final String noticeId;
  final Direction direction;

  @override
  Map<String, dynamic> requestMapBody() => {
        "userId": userId,
        "id": noticeId,
        "where": direction.name,
      };
}
