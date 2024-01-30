import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    required this.textInputWidth,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.onChanged,
    super.key,
  });
  final String hintText;
  final double textInputWidth;
  final Icon icon;
  final TextEditingController controller;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: textInputWidth,
      height: heightOfTextField,
      child: TextFormField(
        onChanged: (value) {
          onChanged!();
        },
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyle.hintTextStyle,
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(maxBorderRadius),
                borderSide:
                    BorderSide(color: Colors.grey[500]!.withOpacity(0.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(maxBorderRadius),
                borderSide:
                    BorderSide(color: Colors.grey[500]!.withOpacity(0.5)))),
      ),
    );
  }
}
