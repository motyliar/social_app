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

// todo implements main class of icon where we made copyWith method to change dynamiclly
class CustomIcon extends Icon {
  CustomIcon(super.icon);
}
