import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constans/export_constans.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            left: kGeneralPagesMargin, right: kGeneralPagesMargin),
        child: LinearProgressIndicator(
          color: ColorPallete.mainDecorationColor,
          backgroundColor: ColorPallete.pinkDecorationColor,
          minHeight: 30,
          borderRadius: BorderRadius.circular(midBorderRadius),
        ),
      ),
    );
  }
}
