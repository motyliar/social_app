import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({
    this.topMargin = fivePixelsSpaceBetweenWidgets,
    this.bottomMargin = fivePixelsSpaceBetweenWidgets,
    this.dividerHeight = fivePixelsSpaceBetweenWidgets,
    this.gradient = blueGreen,
    super.key,
  });

  final double topMargin;
  final double bottomMargin;
  final double dividerHeight;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      width: MediaQuery.of(context).size.width,
      height: dividerHeight,
      decoration: BoxDecoration(gradient: gradient),
    );
  }
}
