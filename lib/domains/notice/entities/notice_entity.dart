// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    this.localization,
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
  final Set<String>? requests;
  final Set<String>? interested;
  final String? image;
  final bool isActive;
  final String? localization;

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

  NoticeEntity copyWith({
    String? id,
    String? author,
    String? authorId,
    NoticeCategory? category,
    ContentEntity? content,
    List<CommentsEntity>? comments,
    String? createdAt,
    String? updatedAt,
    String? avatar,
    ActionType? type,
    Set<String>? requests,
    Set<String>? interested,
    String? image,
    bool? isActive,
    String? localization,
  }) {
    return NoticeEntity(
      id: id ?? this.id,
      author: author ?? this.author,
      authorId: authorId ?? this.authorId,
      category: category ?? this.category,
      content: content ?? this.content,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      avatar: avatar ?? this.avatar,
      type: type ?? this.type,
      requests: requests ?? this.requests,
      interested: interested ?? this.interested,
      image: image ?? this.image,
      isActive: isActive ?? this.isActive,
      localization: localization ?? this.localization,
    );
  }
}
