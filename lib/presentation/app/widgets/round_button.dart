import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.icon,
    required this.iconSize,
    required this.width,
    this.backgroundGradient = pinkToBlueRoundGradient,
    this.borderRadius = maxBorderRadius,
    super.key,
  });

  final Gradient backgroundGradient;
  final IconData icon;
  final double iconSize;
  final double borderRadius;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white.withOpacity(0.1),
          boxShadow: [downShadow]),
      width: width,
      height: width,
      child: Container(
        margin: const EdgeInsets.all(fivePixelsSpaceBetweenWidgets),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [greyLeftShadow],
          gradient: backgroundGradient,
        ),
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
