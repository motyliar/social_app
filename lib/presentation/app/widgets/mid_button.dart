import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

class MidTextButton extends StatelessWidget {
  const MidTextButton({
    required this.buttonWidth,
    this.buttonHeight = 40,
    required this.textLabel,
    this.borderRadius = midBorderRadius,
    this.backgroundGradient = blueGreenGradient,
    this.textStyle,
    super.key,
  });
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;
  final String textLabel;
  final Gradient backgroundGradient;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kAppStandardMarginard),
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
            child: Text(textLabel,
                style: textStyle ?? AppTextStyle.buttonLabelStyle)),
      ),
    );
  }
}
