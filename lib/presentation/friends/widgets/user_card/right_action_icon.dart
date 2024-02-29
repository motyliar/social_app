import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/themes_export.dart';

class RightActionIcon extends StatelessWidget {
  const RightActionIcon({
    required this.text,
    required this.icon,
    required this.onTap,
    this.textStyle,
    super.key,
  });

  final String text;
  final Icon icon;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: textStyle ?? AppTextStyle.descriptionSmall,
        ),
        const EmptySpaceWidth(),
        GestureDetector(
          child: icon,
        ),
      ],
    );
  }
}
