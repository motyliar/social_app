import 'package:climbapp/presentation/sign_in/widgets/background_card.dart';
import 'package:climbapp/presentation/sign_in/widgets/top_card.dart';
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
