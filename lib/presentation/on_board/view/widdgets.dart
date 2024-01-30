// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CustomPositioned extends StatelessWidget {
  CustomPositioned({required this.begin, required this.end});
  final double left = Random().nextInt(300).toDouble();
  final double top = Random().nextInt(500).toDouble();
  final double begin;
  final double end;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: AnimationClass(
            begin: begin,
            end: end,
            durationInSeconds: 5,
            child: ExpandClass(
              painter: CustomPainto(),
              child: ChildClass(width: 20, height: 20),
            )));
  }
}

class CustomPainto extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10,
        Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AnimationClass extends StatelessWidget {
  final double begin;
  final double end;
  final int durationInSeconds;
  final Widget child;
  const AnimationClass({
    Key? key,
    required this.begin,
    required this.end,
    required this.durationInSeconds,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder(
        tween: Tween<double>(begin: begin, end: end),
        duration: Duration(seconds: durationInSeconds),
        builder: (context, value, _) {
          return Positioned(
              top: value,
              left: value,
              child: Container(
                width: 10,
                height: 10,
                color: Colors.amber,
              ));
        });
  }
}

class ExpandClass extends StatelessWidget {
  const ExpandClass({required this.painter, required this.child, super.key});
  final CustomPainter painter;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: child,
    );
  }
}

class ChildClass extends StatelessWidget {
  const ChildClass({required this.width, required this.height, super.key});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
