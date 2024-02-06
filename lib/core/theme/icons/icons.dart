import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/icons/custom_icons.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const emailIcon = CustomIcon(
    Icons.mail,
  );
  static const passwordIcon = CustomIcon(
    Icons.password,
  );

  static const personIcon = CustomIcon(Icons.person);

  static const infoIcon = CustomIcon(
    Icons.help,
    size: 16,
    color: ColorPallete.pinkDecorationColor,
  );
}
