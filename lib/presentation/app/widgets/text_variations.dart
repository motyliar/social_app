import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class HeadersSmallText extends StatelessWidget {
  const HeadersSmallText(
      {required this.text, this.style = AppTextStyle.headersSmall, super.key});
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) => Text(text, style: style);
}
