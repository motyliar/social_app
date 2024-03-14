import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:flutter/material.dart';

class TypeButton extends StatelessWidget {
  const TypeButton({
    required this.text,
    this.height = 30,
    this.width = 80,
    this.textStyle = AppTextStyle.descriptionMid,
    super.key,
  });

  final double width;
  final double height;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MidTextButton(
      buttonHeight: height,
      buttonWidth: width,
      textLabel: text,
      textStyle: textStyle,
    );
  }
}
