import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/offsets.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

const double _marginFromRight = 20;
const double _marginFromBottom = 50;
const double _totalMargin = 60;

class BottomLabel extends StatelessWidget {
  const BottomLabel({
    super.key,
    required this.appWidth,
    this.width = 200,
    this.height = 60,
    this.borderRadius = kMinBorderRadius,
    this.gradient = blueGreenGradient,
    this.onTap,
  });

  final double width;
  final double height;
  final double borderRadius;
  final double appWidth;
  final Gradient gradient;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        margin: const EdgeInsets.only(
            right: _marginFromRight, bottom: _marginFromBottom),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: ColorPallete.whiteOpacity60,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              greyBoxShadow(offset: topRight),
              greyBoxShadow(offset: bottomLeft)
            ]),
        child: Container(
          padding: const EdgeInsets.all(kMinEmptySpace),
          margin: const EdgeInsets.all(kMinEmptySpace),
          width: appWidth - _totalMargin,
          decoration: BoxDecoration(
              color: ColorPallete.whiteOpacity60,
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: gradient),
          child: const _BottomLabelDescription(),
        ),
      ),
    );
  }
}

class _BottomLabelDescription extends StatelessWidget {
  const _BottomLabelDescription();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(children: [
      Text(l10n.dontHaveAccount, style: AppTextStyle.buttonMediumSizeStyle),
      Text(
        l10n.signUp,
        style: AppTextStyle.buttonMediumSizeStyle,
      )
    ]);
  }
}
