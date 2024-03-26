import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/themes_export.dart';

class Thumbs extends StatelessWidget {
  const Thumbs({
    required this.thumbUp,
    required this.thumbDown,
    this.up = AppIcons.thumbUp,
    this.down = AppIcons.thumbDown,
    super.key,
  });

  final VoidCallback thumbUp;
  final VoidCallback thumbDown;
  final Widget up;
  final Widget down;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => thumbUp(),
          child: up,
        ),
        const Gap(kGeneralPagesMargin),
        GestureDetector(onTap: () => thumbDown(), child: down),
      ],
    );
  }
}
