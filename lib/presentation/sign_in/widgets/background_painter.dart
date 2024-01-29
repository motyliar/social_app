import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0, size.height * 0.60)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.7, size.width, size.height * 0.20)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Color(0xFFffc14d));

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height * 0.55)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.65, size.width, size.height * 0.18)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = const Color(0xFF76e2d8));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
