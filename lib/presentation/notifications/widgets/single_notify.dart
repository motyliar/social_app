import 'package:climbapp/domains/notification/entities/sub_entity/notify_type.dart';
import 'package:climbapp/presentation/notice/widgets/profile_avatar.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

class SingleNotify extends StatelessWidget {
  const SingleNotify({
    required this.type,
    required this.avatar,
    super.key,
  });

  final NotifyType type;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GeneralCard(children: [
        const Gap(kMinEmptySpace),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileAvatar(
              url: avatar,
              radius: 25,
            ),
            Text(
              type.notifyText(context),
              style: AppTextStyle.descriptionBig,
            )
          ],
        ),
      ]),
    );
  }
}
