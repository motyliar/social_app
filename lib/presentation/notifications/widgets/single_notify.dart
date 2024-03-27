import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/domains/notification/entities/sub_entity/notify_type.dart';
import 'package:climbapp/presentation/notice/widgets/profile_avatar.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

class SingleNotify extends StatelessWidget {
  const SingleNotify({
    required this.notification,
    super.key,
  });

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GeneralCard(
          margin: const EdgeInsets.only(
              right: kGeneralPagesMargin,
              left: kMidEmptySpace,
              bottom: kMidEmptySpace),
          padding: const EdgeInsets.all(kMidEmptySpace),
          children: [
            const Gap(kMinEmptySpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileAvatar(
                  url: notification.authorAvatar,
                  radius: 22,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      notification.createdAt.cutTo(16),
                      style: AppTextStyle.descriptionSmall,
                    ),
                    Text(
                      notification.category.notifyText(context),
                      style: AppTextStyle.descriptionBig.copyWith(
                          fontWeight: notification.isRead
                              ? FontWeight.normal
                              : FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ]),
    );
  }
}
