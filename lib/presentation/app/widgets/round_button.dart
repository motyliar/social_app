import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.icon,
    required this.iconSize,
    required this.width,
    this.backgroundGradient = pinkToBlueRoundGradient,
    this.borderRadius = maxBorderRadius,
    this.onTap,
    this.iconMargin = kMidEmptySpace,
    super.key,
  });

  final Gradient backgroundGradient;
  final IconData icon;
  final double iconSize;
  final double borderRadius;
  final double width;
  final VoidCallback? onTap;
  final double iconMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap != null ? onTap!() : null;
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white.withOpacity(1),
            gradient: whiteLinearGradientTopToBottom,
            boxShadow: [downShadow]),
        width: width,
        height: width,
        child: Container(
          margin: EdgeInsets.all(iconMargin),
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
      ),
    );
  }
}

const double _iconSize = 20;
const double _buttonWidth = 50;

class RoundBackButton extends RoundButton {
  const RoundBackButton({
    super.onTap,
    super.key,
  }) : super(
          icon: Icons.arrow_back,
          iconSize: _iconSize,
          width: _buttonWidth,
        );
}
