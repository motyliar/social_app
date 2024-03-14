import 'package:climbapp/domains/notice/entities/notice_enums/exports.dart';

import './sub_entity/sub_entity.dart';

class NoticeEntity {
  const NoticeEntity({
    required this.id,
    required this.author,
    required this.authorId,
    required this.category,
    required this.content,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
    required this.type,
    this.requests,
    this.interested,
    this.image,
    this.comments,
  });

  final String id;
  final String author;
  final String authorId;
  final NoticeCategory category;
  final ContentEntity content;
  final List<CommentsEntity>? comments;
  final String createdAt;
  final String updatedAt;
  final String avatar;
  final ActionType type;
  final List<String>? requests;
  final List<String>? interested;
  final String? image;
  final bool isActive;

  Map<String, dynamic> toJson() => {
        'author': author,
        'authorId': authorId,
        'category': category.name,
        'content': content.toJson(),
        'avatar': avatar,
        'type': type.name,
        'image': image,
      };

  @override
  toString() =>
      'NoticeEntity(id: $id, author: $author, authorId: $authorId, category: $category, content: $content,)';
}
