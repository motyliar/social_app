import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

class EndOfPage extends StatelessWidget {
  const EndOfPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(kGeneralPagesMargin),
        GradientDivider(
          dividerHeight: kMidDividerHeight,
        ),
        Gap(kGeneralPagesMargin),
      ],
    );
  }
}
