import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:flutter/material.dart';

const double _totalMargin = 60;

class TopCard extends StatelessWidget {
  TopCard({
    required this.appWidth,
    this.borderRadius = kMinBorderRadius,
    super.key,
  });
  final Gradient gradient = whiteGreyLinearGradient;
  final double appWidth;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        kMidEmptySpace,
      ),
      width: appWidth - _totalMargin,
      decoration: BoxDecoration(
          color: ColorPallete.whiteOpacity80,
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient),
    );
  }
}
