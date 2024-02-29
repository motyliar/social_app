import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({
    this.topMargin = kMinEmptySpace,
    this.bottomMargin = kMinEmptySpace,
    this.dividerHeight = kMinEmptySpace,
    this.gradient = blueGreen,
    this.child,
    this.width,
    this.borderRadius,
    super.key,
  });

  final double topMargin;
  final double bottomMargin;
  final double dividerHeight;
  final Gradient gradient;
  final Widget? child;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      width: width ?? MediaQuery.of(context).size.width,
      height: dividerHeight,
      decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius),
      child: child,
    );
  }
}
