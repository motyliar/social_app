import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/offsets.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

const double totalMargin = 60;
const double heightMultipler = 0.36;

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
    required this.appWidth,
    required this.appHeight,
    required this.child,
    this.borderRadius = minBorderRadius,
  });

  final double appWidth;
  final double appHeight;
  final Widget child;
  final double borderRadius;
  final double _marginFromMainBox = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(right: _marginFromMainBox, left: _marginFromMainBox),
      width: appWidth - totalMargin,
      height: appHeight * heightMultipler,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            greyBoxShadow(offset: topRight),
            greyBoxShadow(offset: bottomLeft)
          ]),
      child: child,
    );
  }
}