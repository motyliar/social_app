import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:flutter/material.dart';

const double _paddingSides = 10;
const double _paddingUpDown = 15;
const double _buttonHeight = 50;
const double _buttonWidth = 120;
const double _backgroundImageOpacity = 0.5;

class HorizontalNavigatorButton extends StatelessWidget {
  const HorizontalNavigatorButton({
    super.key,
    required this.descriptionText,
    required this.onTap,
    this.paddingSides = _paddingSides,
    this.paddingUpDown = _paddingUpDown,
    this.gradient = redLinearGradientTopToBottom,
    this.height = _buttonHeight,
    this.width = _buttonWidth,
    this.descriptionImagePosition = const Offset(0, 12),
    this.descriptionImageURL = ImagesURL.messageIcon,
    this.descriptionImageSize = const Size(40, 40),
    this.backgroundImageURL = ImagesURL.waveIcon,
    this.backgroundImageSize = const Size(120, 120),
    this.backgroundImageOpacity = _backgroundImageOpacity,
  });

  final double paddingSides;
  final double paddingUpDown;
  final Gradient gradient;
  final String descriptionText;
  final double width;
  final double height;
  final Offset descriptionImagePosition;
  final String descriptionImageURL;
  final Size descriptionImageSize;
  final String backgroundImageURL;
  final Size backgroundImageSize;
  final double backgroundImageOpacity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: paddingSides,
                right: paddingSides,
                top: paddingUpDown,
                bottom: paddingUpDown),
            child: ContainerTemplate(
              color: Colors.white,
              gradient: gradient,
              width: width,
              height: height,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    descriptionText,
                    style: AppTextStyle.descriptionMid,
                  )),
            ),
          ),
          Positioned(
            child: Opacity(
              opacity: 0.5,
              child: Image.network(
                backgroundImageURL,
                width: backgroundImageSize.width,
                height: backgroundImageSize.height,
              ),
            ),
          ),
          Positioned(
              top: descriptionImagePosition.dx,
              right: descriptionImagePosition.dy,
              child: Image.network(
                descriptionImageURL,
                width: descriptionImageSize.width,
                height: descriptionImageSize.height,
              )),
        ],
      ),
    );
  }
}
