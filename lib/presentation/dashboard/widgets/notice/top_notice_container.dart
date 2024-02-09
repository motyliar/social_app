import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

const List<BoxShadow> _boxShadows = [downShadow, greyLeftShadow];

class TopNoticeContainer extends StatelessWidget {
  const TopNoticeContainer({
    required this.notice,
    required this.topDescription,
    this.boxShadows = _boxShadows,
    super.key,
  });
  final NoticeEntity notice;
  final List<BoxShadow> boxShadows;
  final Widget topDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: fivePixelsSpaceBetweenWidgets,
        left: fivePixelsSpaceBetweenWidgets,
        top: fivePixelsSpaceBetweenWidgets,
      ),
      padding: const EdgeInsets.all(fivePixelsSpaceBetweenWidgets),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadows,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(maxBorderRadius),
          topRight: Radius.circular(maxBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(fivePixelsSpaceBetweenWidgets),
        child: Column(
          children: [
            topDescription,
            const GradientDivider(),
            Text(
              notice.content.content.cut,
              style: AppTextStyle.descriptionMid,
            ),
            noticeDivider(),
            const SummaryRow(),
            const GradientDivider(),
            const ActionRow(),
          ],
        ),
      ),
    );
  }
}
