import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CheckBoxWidgets extends StatelessWidget {
  const CheckBoxWidgets(
      {required this.isCheck,
      this.onTap,
      this.size = 18,
      this.color = Colors.red,
      super.key});

  final double size;
  final Color color;
  final bool isCheck;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMinBorderRadius),
        ),
        child: Container(
          color: isCheck
              ? Colors.grey.withOpacity(0.3)
              : ColorPallete.greyShadowColorOpacityMax,
          width: size,
          height: size,
          child: isCheck
              ? Icon(
                  Icons.done,
                  size: size,
                  color: ColorPallete.pinkDecorationColor,
                  weight: 700,
                  grade: 200,
                )
              : null,
        ),
      ),
    );
  }
}
