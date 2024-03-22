import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app/widgets/active_dot.dart';
import 'package:climbapp/presentation/app/widgets/text_variations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActiveCategory extends StatelessWidget {
  const ActiveCategory({
    super.key,
    required this.notice,
  });

  final NoticeEntity notice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActiveDot(isActive: notice.isActive),
        const Gap(kMidEmptySpace),
        HeadersSmallText(text: notice.category.name.toUpperCase()),
      ],
    );
  }
}
