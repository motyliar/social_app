import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:flutter/material.dart';

class EmptySpace extends StatelessWidget {
  const EmptySpace({this.height = kMidEmptySpace, super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class EmptySpaceWidth extends SizedBox {
  const EmptySpaceWidth({super.width = kMinEmptySpace, super.key});
}
