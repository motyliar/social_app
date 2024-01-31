import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

const double _maxAppBlur = 20;
const double _midAppBlur = 14;
const double _spreadValue = 1;

final BoxShadow downShadow = BoxShadow(
    offset: const Offset(4, 4),
    blurRadius: _midAppBlur,
    spreadRadius: _spreadValue,
    color: ColorPallete().greyShadowColor);

const greyLeftShadow = BoxShadow(
  offset: Offset(0, 7),
  color: Colors.grey,
  spreadRadius: _spreadValue,
  blurRadius: _maxAppBlur,
);
