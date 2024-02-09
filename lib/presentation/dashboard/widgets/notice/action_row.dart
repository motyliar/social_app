import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/custom_icons.dart';
import 'package:flutter/material.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    this.bookmarkIcon = Icons.bookmark,
    this.commentIcon = Icons.comment,
    this.replyIcon = Icons.reply,
    super.key,
  });

  final IconData bookmarkIcon;
  final IconData commentIcon;
  final IconData replyIcon;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            CustomIcon(bookmarkIcon),
            Text(
              l10n.noticeSave,
              style: AppTextStyle.descriptionMid,
            ),
          ],
        ),
        Column(
          children: [
            CustomIcon(commentIcon),
            Text(
              l10n.noticeAddComment,
              style: AppTextStyle.descriptionMid,
            ),
          ],
        ),
        Column(
          children: [
            CustomIcon(replyIcon),
            Text(
              l10n.noticeReply,
              style: AppTextStyle.descriptionMid,
            ),
          ],
        ),
      ],
    );
  }
}
