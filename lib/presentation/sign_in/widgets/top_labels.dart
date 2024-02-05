import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class TopLabels extends StatelessWidget {
  const TopLabels({
    required this.bigLabelText,
    required this.descriptionLabelText,
    this.marginFromLeft = 100,
    super.key,
  });

  final String bigLabelText;
  final String descriptionLabelText;
  final double marginFromLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: marginFromLeft),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bigLabelText, style: AppTextStyle.headersBig),
            Text(descriptionLabelText, style: AppTextStyle.descriptionBig),
          ],
        ));
  }
}
