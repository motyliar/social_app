import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NoticeLogic {
  static bool didIClick(Set<String> idsList, String userId) {
    for (var likes in idsList) {
      if (likes == userId) {
        return true;
      }
    }
    return false;
  }

  static addCommentSheet(
    BuildContext context,
    TextEditingController controller,
    NoticeEntity notice,
  ) {
    final l10n = context.l10n;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddComment(
        l10n: l10n,
        controller: controller,
        notice: notice,
      ),
    ).whenComplete(() => controller.clear());
  }
}
