import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:flutter/material.dart';

const double _totalMargin = 60;
const double _heightMultiplier = 0.4;

class TopCard extends StatelessWidget {
  TopCard({
    required this.appWidth,
    required this.appHeight,
    this.borderRadius = minBorderRadius,
    super.key,
  });
  final Gradient gradient = whiteGreyLinearGradient;
  final double appWidth;
  final double appHeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        tenPixelsSpaceBetweenWidgets,
      ),
      width: appWidth - _totalMargin,
      height: appWidth * _heightMultiplier,
      decoration: BoxDecoration(
          color: ColorPallete.whiteOpacity80,
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient),
    );
  }
}
