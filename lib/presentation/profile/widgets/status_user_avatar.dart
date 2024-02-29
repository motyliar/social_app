import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

const double _rightPosition = 10;

class StatusUserAvatar extends StatelessWidget {
  const StatusUserAvatar({
    super.key,
    required this.isActive,
    required this.avatar,
    this.radius = kBigAvatar,
    this.activeDotRadius = kDotActiveBig,
    this.dotRightPosition = _rightPosition,
  });

  final bool isActive;
  final double radius;
  final String avatar;
  final double activeDotRadius;
  final double dotRightPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(avatar),
      ),
      Positioned(
          bottom: 0,
          right: dotRightPosition,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: isActive
                ? ColorPallete.greenActiveColor
                : ColorPallete.greyShadowColorOpacityMax,
          ))
    ]);
  }
}
