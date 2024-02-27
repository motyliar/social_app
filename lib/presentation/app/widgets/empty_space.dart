import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:flutter/material.dart';

class EmptySpace extends StatelessWidget {
  const EmptySpace({this.height = tenPixelsSpaceBetweenWidgets, super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
