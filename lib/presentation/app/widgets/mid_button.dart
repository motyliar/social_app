import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

const double _buttonTextPaddingHorizontal = 10;
const double _buttonTextPaddingVertical = 5;

class MidTextButton extends StatelessWidget {
  const MidTextButton({
    required this.textLabel,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius = midBorderRadius,
    this.backgroundGradient = blueGreenGradient,
    this.margin = const EdgeInsets.only(top: kAppStandardMarginard),
    this.textStyle,
    this.onTap,
    super.key,
  });
  final double? buttonWidth;
  final double? buttonHeight;
  final double borderRadius;
  final String textLabel;
  final Gradient backgroundGradient;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap == null ? null : onTap!();
      },
      child: Container(
        margin: margin,
        width: buttonWidth,
        height: buttonHeight ?? 40,
        decoration:
            BoxDecoration(color: Colors.white.withOpacity(0.1), boxShadow: [
          downShadow,
        ]),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: _buttonTextPaddingHorizontal,
              vertical: _buttonTextPaddingVertical),
          // width: buttonWidth,
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
      ),
    );
  }
}
