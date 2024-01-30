import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:flutter/material.dart';

class TopBackgroundImage extends StatelessWidget {
  const TopBackgroundImage({
    this.backgroundImageHeight = 300,
    this.imageBackground = ImagesURL.signInTopBackground,
    super.key,
  });
  final double backgroundImageHeight;
  final String imageBackground;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: backgroundImageHeight,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(maxBorderRadius),
                bottomRight: Radius.circular(maxBorderRadius))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          imageBackground,
          height: backgroundImageHeight,
        ),
      ),
    );
  }
}
