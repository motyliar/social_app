import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ActiveDot extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inActiveColor;
  final double radius;
  const ActiveDot(
      {required this.isActive,
      this.activeColor = ColorPallete.greenActiveColor,
      this.inActiveColor = ColorPallete.greyShadowColorOpacityMax,
      this.radius = 8,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius,
        backgroundColor: isActive ? activeColor : inActiveColor);
  }
}
