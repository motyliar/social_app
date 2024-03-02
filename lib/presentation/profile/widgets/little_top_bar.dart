import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';
import '../../app/widgets/app_widgets.dart';
import '../../app/widgets/button_icon.dart';

class LitlleTopBar extends StatelessWidget {
  const LitlleTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientDivider(
      dividerHeight: 70,
      topMargin: 0,
      bottomMargin: kGeneralPagesMargin,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(midBorderRadius),
          bottomRight: Radius.circular(midBorderRadius)),
      child: Padding(
        padding: const EdgeInsets.only(
            top: kMinEmptySpace,
            right: kGeneralPagesMargin,
            left: kGeneralPagesMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RoundBackButton(
                  onTap: () => Navigator.of(context).pop(),
                ),
                Gap(kGeneralPagesMargin),
                Transform.rotate(
                    angle: 7, child: Image.network(ImagesURL.appLogoSmallM)),
              ],
            ),
            ButtonIcon(
                onTap: () => Navigator.popAndPushNamed(context, routeUserMain),
                child: AppIcons.personIcon.copyWith(
                    size: 30, color: ColorPallete.pinkDecorationColor)),
          ],
        ),
      ),
    );
  }
}
