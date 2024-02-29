import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends Icon {
  const CustomIcon(
    super.icon, {
    super.color = ColorPallete.mainDecorationColor,
    super.size,
    super.key,
  });

  CustomIcon copyWith({Color? color, double? size}) =>
      CustomIcon(icon, color: color ?? this.color, size: size ?? this.size);
}
