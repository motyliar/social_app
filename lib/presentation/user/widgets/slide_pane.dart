import 'package:climbapp/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

const double _paneWidth = 120;
const double _paneHeight = 50;

class SlidePane extends StatelessWidget {
  const SlidePane({
    super.key,
    required this.l10n,
    required this.icon,
    required this.text,
    required this.onTap,
    this.width = _paneWidth,
    this.height = _paneHeight,
    this.backgroundColor = ColorPallete.mainDecorationColor,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(kSmallButtonBorderRadius),
      bottomLeft: Radius.circular(
        kSmallButtonBorderRadius,
      ),
    ),
  });

  final AppLocalizations l10n;
  final double width;
  final double height;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final Widget icon;
  final Widget text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          text,
          const Gap(kMinEmptySpace),
          GestureDetector(
            onTap: () => onTap(),
            child: icon,
          ),
          const Gap(kMinEmptySpace),
        ],
      ),
    );
  }
}
