import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/notice/widgets/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/themes_export.dart';

class SingleCommentUserNotice extends StatelessWidget {
  const SingleCommentUserNotice({
    super.key,
    required this.notice,
    required this.index,
  });

  final NoticeEntity notice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileAvatar(
              url: notice.comments![index].avatar,
            ),
            Row(
              children: [
                Text(
                  notice.comments![index].user,
                  style: AppTextStyle.descriptionBig
                      .copyWith(fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
                const Gap(kMidEmptySpace),
                Text(
                  notice.comments![index].createdAt.cutTo(10),
                  style: AppTextStyle.descriptionMid,
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorPallete.mainDecorationColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              notice.comments![index].content.capitalize(),
            ),
          ),
        ),
      ],
    );
  }
}
