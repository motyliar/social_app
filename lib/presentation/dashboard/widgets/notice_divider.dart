import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

const double _thickness = 0.5;
const double _marginFromSides = 20.0;

Widget noticeDivider(
    {double thickness = _thickness,
    Color color = ColorPallete.mainDecorationColor,
    double indent = _marginFromSides,
    double endIndent = _marginFromSides}) {
  return Divider(
    thickness: thickness,
    color: color,
    indent: indent,
    endIndent: endIndent,
  );
}
