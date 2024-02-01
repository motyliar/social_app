import 'package:climbapp/presentation/sign_in/widgets/background_card.dart';
import 'package:climbapp/presentation/sign_in/widgets/top_card.dart';
import 'package:flutter/material.dart';

class MainStackCard extends StatelessWidget {
  const MainStackCard(
      {super.key,
      required this.appWidth,
      required this.appHeight,
      this.heightMultipler = 0.36});

  final double appWidth;
  final double appHeight;
  final double heightMultipler;

  @override
  Widget build(BuildContext context) {
    final double totalHeight = appHeight * heightMultipler;
    return SizedBox(
      width: appWidth,
      child: BackgroundCard(
        totalHeight: totalHeight,
        appWidth: appWidth,
        child: TopCard(
          appWidth: appWidth,
        ),
      ),
    );
  }
}
