import 'package:climbapp/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class DetailsTextField extends StatelessWidget {
  const DetailsTextField(
      {required this.controller,
      this.rightPadding,
      this.leftPadding = 10,
      this.numberKeybord = false,
      super.key});

  final TextEditingController controller;
  final double? leftPadding;
  final double? rightPadding;
  final bool numberKeybord;
  @override
  Widget build(BuildContext context) => Padding(
        padding:
            EdgeInsets.only(left: leftPadding ?? 0, right: rightPadding ?? 0),
        child: SizedBox(
          width: 130,
          child: TextFormField(
            keyboardType:
                numberKeybord ? TextInputType.number : TextInputType.text,
            style: AppTextStyle.descriptionMid,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      );
}
