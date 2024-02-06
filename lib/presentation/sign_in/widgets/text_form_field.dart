import 'dart:ui';

import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    required this.hintText,
    required this.icon,
    required this.controller,
    this.textInputWidth = 120,
    this.toolTip,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.focusNode,
    this.nextFocus,
    this.isNextFocus = true,
    this.isToolTip = false,
    super.key,
  });
  final String hintText;
  final String? toolTip;
  final double textInputWidth;
  final Icon icon;
  final TextEditingController controller;
  final VoidCallback? onChanged;
  final Function(String?)? validator;
  final bool obscureText;
  final bool isNextFocus;
  final bool isToolTip;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: textInputWidth,
      child: TextFormField(
        focusNode: focusNode,
        onFieldSubmitted: isNextFocus
            ? (value) {
                FocusScope.of(context).requestFocus(nextFocus);
              }
            : null,
        selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
        onChanged: (value) {},
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
          suffixIcon: isToolTip
              ? Tooltip(message: toolTip, child: AppIcons.infoIcon)
              : null,
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
