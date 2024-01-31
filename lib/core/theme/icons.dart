import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const emailIcon = Icon(
    Icons.mail,
    color: ColorPallete.mainDecorationColor,
  );
  static const passwordIcon = Icon(
    Icons.password,
    color: ColorPallete.mainDecorationColor,
  );
}

// todo implements main class of icon where we made copyWith method to change dynamicllyCustom
class CustomIcon extends Icon {
  const CustomIcon(
    super.icon, {
    this.color,
    this.size,
    super.key,
  });

  final Color? color;
  final double? size;

  CustomIcon copyWith(Color? color, double? size) =>
      CustomIcon(icon, color: color ?? this.color, size: size ?? this.size);
}

CustomIcon emailIcon = CustomIcon(
  Icons.password,
);
