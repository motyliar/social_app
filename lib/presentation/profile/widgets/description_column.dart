import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class DescriptionColumn extends StatelessWidget {
  const DescriptionColumn(
      {required this.elements,
      required this.texts,
      this.textStyle = AppTextStyle.descriptionMid,
      super.key});

  final int elements;
  final List<String> texts;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        elements,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            texts[index],
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
