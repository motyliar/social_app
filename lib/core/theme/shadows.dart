import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

const double _maxAppBlur = 20;
const double _midAppBlur = 14;
const double _spreadValue = 1;

final BoxShadow downShadow = BoxShadow(
    offset: const Offset(4, 4),
    blurRadius: _midAppBlur,
    spreadRadius: _spreadValue,
    color: ColorPallete().greyShadowColorOpacityMax);

const greyLeftShadow = BoxShadow(
  offset: Offset(2, 5),
  color: Colors.grey,
  spreadRadius: _spreadValue,
  blurRadius: _maxAppBlur,
);
BoxShadow greyBoxShadow({required Offset offset, Color? color}) => BoxShadow(
    offset: Offset(offset.dx, offset.dy),
    blurRadius: _maxAppBlur,
    spreadRadius: _spreadValue,
    color: color ?? ColorPallete().greyShadowColorOpacityMid);
