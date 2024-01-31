import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class TopLabels extends StatelessWidget {
  const TopLabels({
    required this.bigLabel,
    required this.descriptionLabel,
    this.marginFromLeft = 100,
    super.key,
  });

  final String bigLabel;
  final String descriptionLabel;
  final double marginFromLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: marginFromLeft),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bigLabel, style: AppTextStyle.headersBig),
            Text(descriptionLabel, style: AppTextStyle.descriptionBig),
          ],
        ));
  }
}
