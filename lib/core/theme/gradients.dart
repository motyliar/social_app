import 'package:flutter/material.dart';

const blueGreenGradient = SweepGradient(center: Alignment.topLeft, colors: [
  Color(0xFF59D7C8),
  Color(0xFFA3F264),
  Color(0xFFF539A8),
]);

const blueGreen = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 110, 216, 204),
      Color.fromRGBO(158, 158, 158, 0.8),
      Color(0xFFA3F264),
    ]);

const pinkToBlueRoundGradient =
    SweepGradient(center: Alignment.topLeft, colors: [
  Color(0xFFF539A8),
  Color(0xFFA3F264),
  Color(0xFF59D7C8),
]);

final whiteGreyLinearGradient = LinearGradient(
  colors: [Colors.white, Colors.grey.withOpacity(0.2), Colors.white],
);
final whiteLinearGradientTopToBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white.withOpacity(0.0),
      Colors.white.withOpacity(0.0),
      Colors.white
    ]);

const redLinearGradientTopToBottom = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 248, 244, 244),
      Colors.white,
      Color.fromARGB(255, 110, 216, 204),
    ]);

const greyNeutralGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Colors.grey, Colors.white, Colors.grey]);
