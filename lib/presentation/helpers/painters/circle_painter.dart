import 'dart:math';
import 'package:flutter/material.dart';

const double calculateCenter = 0.5;

abstract class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate);
}

class CirclePainter extends MyCustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> positions = [
      Offset(size.width / 2, 50),
      Offset(size.width * 0.25, 30),
      Offset(size.width * 0.75, 15)
    ];
    final generate = getOffsets();
    for (var position in generate) {
      canvas.drawCircle(
          position, 10, Paint()..color = Colors.grey.withOpacity(0.5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<Offset> getOffsets() {
    return _generate();
  }

  List<Offset> _generate() {
    final list = List.generate(
        50,
        (index) => Offset(Random().nextInt(300).toDouble(),
            Random().nextInt(400).toDouble()));
    return list;
  }
}

class PainterGenerator {
  PainterGenerator({required this.painter}) : _list = <CustomPainter>[];
  final CustomPainter painter;
  final List<CustomPainter> _list;

  List<void> generate(Canvas canvas, int elements, Size size) {
    List<void> canvasList = [];
    for (int i = 0; i < elements; i++) {
      double dx = size.width * Random().nextDouble() * 30;
      double dy = size.height * Random().nextDouble() * 30;
      double circleSize = Random().nextDouble() * 30;

      final canva = canvas.drawCircle(
          Offset(dx, dy), circleSize, Paint()..color = Colors.grey);
      canvasList.add(canva);
    }
    return canvasList;
  }

  List<CustomPainter> get getAll => _list;
  Iterable<CustomPainter> get iterator => _list;
}
