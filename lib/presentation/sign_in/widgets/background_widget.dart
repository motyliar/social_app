import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/custom_paint.dart';

Widget BackgroundPainterWidget(
    {CustomPainter painter = const BackgroundPainter(), required Size size}) {
  return CustomPaint(
    painter: painter,
    child: SizedBox(
      width: size.width,
      height: size.height,
    ),
  );
}
