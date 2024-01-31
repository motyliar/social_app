import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

class MidTextButton extends StatelessWidget {
  const MidTextButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.textLabel,
    this.borderRadius = midBorderRadius,
    this.backgroundGradient = blueGreenGradient,
    super.key,
  });
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;
  final String textLabel;
  final Gradient backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appStandardMargin),
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white.withOpacity(0.1),
          boxShadow: [
            downShadow,
          ]),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [greyLeftShadow],
            gradient: backgroundGradient),
        child: Align(
            alignment: Alignment.center,
            child: Text(textLabel, style: AppTextStyle.buttonLabelStyle)),
      ),
    );
  }
}
