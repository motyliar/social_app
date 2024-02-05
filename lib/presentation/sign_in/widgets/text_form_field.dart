import 'dart:ui';

import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    required this.hintText,
    required this.icon,
    required this.controller,
    this.textInputWidth = 120,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    super.key,
  });
  final String hintText;
  final double textInputWidth;
  final Icon icon;
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: textInputWidth,
      // height: heightOfTextField,
      child: TextFormField(
        selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
        onChanged: (value) {
          print('hello');
        },
        validator: (value) {
          return validator != null ? validator!(value) : null;
        },
        obscureText: obscureText,
        controller: controller,
        style: AppTextStyle.textFieldStyle,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
          isDense: true,
          hintText: hintText,
          hintStyle: AppTextStyle.hintTextStyle,
          prefixIcon: icon,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(maxBorderRadius),
              borderSide:
                  BorderSide(color: Colors.grey[500]!.withOpacity(0.5))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(maxBorderRadius),
              borderSide:
                  BorderSide(color: Colors.grey[500]!.withOpacity(0.5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(maxBorderRadius),
              borderSide:
                  BorderSide(color: Colors.grey[500]!.withOpacity(0.5))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(maxBorderRadius),
            borderSide: BorderSide(
              color: Colors.grey[500]!.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
