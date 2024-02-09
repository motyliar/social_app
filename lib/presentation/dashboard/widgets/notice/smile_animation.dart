import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class SmileAnimation extends StatelessWidget {
  const SmileAnimation(
      {super.key,
      this.tweenBegin = 0,
      this.tweenEnd = 90,
      this.durationInMilliseconds = 650,
      this.animationIcon = Icons.mood,
      this.iconColor = Colors.yellow});

  final double tweenBegin;
  final double tweenEnd;
  final int durationInMilliseconds;
  final IconData animationIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: PlayAnimationBuilder(
          curve: Curves.bounceIn,
          tween: Tween<double>(begin: tweenBegin, end: tweenEnd),
          duration: Duration(milliseconds: durationInMilliseconds),
          builder: (context, value, _) => Icon(
            animationIcon,
            size: value,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
