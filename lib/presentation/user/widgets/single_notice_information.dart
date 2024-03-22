import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';
import '../../app/widgets/app_widgets.dart';

class SingleNoticeInformationPreview extends StatelessWidget {
  const SingleNoticeInformationPreview({
    super.key,
    required this.notice,
    required this.l10n,
    required this.onDelete,
    required this.onEdit,
  });

  final NoticeEntity notice;
  final AppLocalizations l10n;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidePane(
          onTap: () => onDelete(),
          l10n: l10n,
          icon: AppIcons.deleteBig,
          text: HeadersSmallText(text: l10n.editText.toUpperCase()),
        ),
      ]),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidePane(
            onTap: () => onEdit(),
            l10n: l10n,
            icon: AppIcons.editBig,
            text: HeadersSmallText(
              text: l10n.deleteButton.toUpperCase(),
            ),
            backgroundColor: ColorPallete.mainTextColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(kSmallButtonBorderRadius),
              bottomRight: Radius.circular(
                kSmallButtonBorderRadius,
              ),
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notice.content.title.capitalize(),
                style: AppTextStyle.descriptionBig
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Gap(kMinEmptySpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notice.category.name.toUpperCase(),
                style: AppTextStyle.descriptionSmall,
              ),
              Row(
                children: [
                  Text(
                    '${l10n.commentText} ${notice.comments?.length}',
                    style: AppTextStyle.descriptionSmall,
                  ),
                  const SizedBox(
                    width: kMinEmptySpace,
                  ),
                ],
              ),
            ],
          ),
          const Gap(kMinEmptySpace),
        ],
      ),
    );
  }
}
