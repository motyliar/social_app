import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

const double _backgroundHeight = 30;
const double _backgroundWidth = 70;

class AppLogoButton extends StatelessWidget {
  const AppLogoButton({
    this.backgroundHeight = _backgroundHeight,
    this.backgroundWidth = _backgroundWidth,
    this.logoURL = ImagesURL.appLogoSmallM,
    this.backgroundMargin,
    super.key,
  });

  final double backgroundHeight;
  final double backgroundWidth;
  final String logoURL;
  final EdgeInsetsGeometry? backgroundMargin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MidTextButton(
            margin: backgroundMargin ?? const EdgeInsets.all(0),
            buttonHeight: backgroundHeight,
            buttonWidth: backgroundWidth,
            textLabel: ''),
        Image.network(logoURL)
      ],
    );
  }
}
