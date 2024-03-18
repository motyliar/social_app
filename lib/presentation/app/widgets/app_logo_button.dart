import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

const double _backgroundHeight = 30;
const double _backgroundWidth = 70;

class AppLogoButton extends StatelessWidget {
  const AppLogoButton({
    required this.onTap,
    this.backgroundHeight = _backgroundHeight,
    this.backgroundWidth = _backgroundWidth,
    this.logoURL = ImagesURL.appLogoSmallM,
    this.backgroundMargin,
    this.isJoin = false,
    super.key,
  });

  final double backgroundHeight;
  final double backgroundWidth;
  final String logoURL;
  final EdgeInsetsGeometry? backgroundMargin;
  final bool isJoin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isJoin ? 0.2 : 1,
        child: Stack(
          children: [
            MidTextButton(
                margin: backgroundMargin ?? const EdgeInsets.all(0),
                buttonHeight: backgroundHeight,
                buttonWidth: backgroundWidth,
                textLabel: ''),
            Image.network(logoURL)
          ],
        ),
      ),
    );
  }
}
