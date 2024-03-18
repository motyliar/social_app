import 'package:climbapp/domains/notice/entities/notice_enums/sports_category.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/type_action.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';

Map<String, dynamic> sendNotice(
    {required String author,
    required String authorId,
    required NoticeCategory category,
    required String avatar,
    required ActionType type,
    required ContentEntity content,
    String? image,
    String? localization}) {
  return {
    'notice': {
      'author': author,
      'authorId': authorId,
      'category': category.name,
      'content': {
        'title': content.title,
        'content': content.content,
        'when': content.when,
      },
      'avatar': avatar,
      'type': type.name,
      'image': image,
      'localization': localization ?? '',
    }
  };
}
