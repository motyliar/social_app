import 'package:flutter/material.dart';

class AnimatedAction extends StatelessWidget {
  const AnimatedAction(
      {required this.childOne,
      required this.childTwo,
      required this.condition,
      this.durationInMiliseconds = 300,
      super.key});

  final Widget childOne;
  final Widget childTwo;
  final bool condition;
  final int durationInMiliseconds;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: durationInMiliseconds),
      child: condition ? childOne : childTwo,
    );
  }
}
