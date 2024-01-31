import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:flutter/material.dart';

class BottomBackgroundBar extends StatelessWidget {
  const BottomBackgroundBar({
    this.borderRadius = maxBorderRadius,
    super.key,
  });
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(50))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(ImagesURL.signInBottomBackground),
    );
  }
}
