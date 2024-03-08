import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Material(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(ImagesURL.appLogo),
            const Gap(kGeneralPagesMargin),
            Padding(
              padding: const EdgeInsets.only(
                  left: kGeneralPagesMargin, right: kGeneralPagesMargin),
              child: LinearProgressIndicator(
                color: ColorPallete.mainDecorationColor,
                backgroundColor: ColorPallete.pinkDecorationColor,
                minHeight: 30,
                borderRadius: BorderRadius.circular(midBorderRadius),
              ),
            ),
            const Gap(kGeneralPagesMargin),
            HeadersSmallText(text: l10n.loading)
          ]),
    );
  }
}
