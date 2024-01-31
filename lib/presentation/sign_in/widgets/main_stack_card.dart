import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/offsets.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/presentation/sign_in/widgets/background_card.dart';
import 'package:flutter/material.dart';

class MainStackCard extends StatelessWidget {
  const MainStackCard({
    super.key,
    required this.appWidth,
    required this.appHeight,
  });

  final double appWidth;
  final double appHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: appWidth,
      child: BackgroundCard(
        appWidth: appWidth,
        appHeight: appHeight,
        child: TopCard(
          appWidth: appWidth,
          appHeight: appHeight,
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  TopCard({
    required this.appWidth,
    required this.appHeight,
    this.borderRadius = minBorderRadius,
    super.key,
  });
  final Gradient gradient = whiteGreyLinearGradient;
  final double appWidth;
  final double appHeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        tenPixelsSpaceBetweenWidgets,
      ),
      width: appWidth - 60,
      height: appWidth * 0.4,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient),
    );
  }
}
