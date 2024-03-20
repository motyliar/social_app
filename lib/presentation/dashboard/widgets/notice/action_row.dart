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
        DescriptionIcon(icon: bookmarkIcon, text: l10n.noticeSave),
        DescriptionIcon(icon: commentIcon, text: l10n.noticeAddComment),
        DescriptionIcon(icon: replyIcon, text: l10n.noticeReply),
      ],
    );
  }
}

class DescriptionIcon extends StatelessWidget {
  const DescriptionIcon({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : null,
      child: Column(
        children: [
          CustomIcon(icon),
          Text(
            text,
            style: AppTextStyle.descriptionMid,
          ),
        ],
      ),
    );
  }
}
