import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

class ResolvedThumbs extends StatelessWidget {
  const ResolvedThumbs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(children: [
      const Opacity(
        opacity: 0.2,
        child: Row(
          children: [
            AppIcons.thumbUp,
            Gap(kGeneralPagesMargin),
            AppIcons.thumbDown
          ],
        ),
      ),
      Positioned(
        top: 3,
        left: 10,
        child: HeadersSmallText(text: l10n.resolved),
      ),
    ]);
  }
}
