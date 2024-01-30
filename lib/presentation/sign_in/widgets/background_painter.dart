import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  const BackgroundPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(colors: [
      Color(0xFF59D7C8),
      Color(0xFFA3F264),
      Color(0xFFF539A8),
    ]);
    Path orangeArc = Path()
      ..moveTo(0, 0.0)
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.3, size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    final paint = Paint()
      ..color = Color(0xFFffc14d)
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(orangeArc, paint);

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height * 0.95)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.25, size.width, size.height * 0.48)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
