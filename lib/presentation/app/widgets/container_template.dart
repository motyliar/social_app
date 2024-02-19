import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

@immutable
class ContainerTemplate extends StatelessWidget {
  ContainerTemplate(
      {required this.width,
      this.borderRadius = maxBorderRadius,
      this.child,
      this.color = Colors.transparent,
      this.height,
      this.gradient,
      this.padding,
      this.margin,
      super.key});

  final double width;
  final double? height;
  final Widget? child;
  final double borderRadius;
  final Color color;
  final Gradient? gradient;
  final List<BoxShadow> boxShadows = [downShadow, greyLeftShadow];
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(Object context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          boxShadow: boxShadows),
      child: child,
    );
  }
}
