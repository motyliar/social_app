import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/presentation/user/widgets/details_text_field.dart';
import 'package:flutter/material.dart';

class EditingTextField extends StatelessWidget {
  const EditingTextField({
    super.key,
    required this.nameController,
    required this.fieldName,
    this.textStyle = AppTextStyle.descriptionMid,
    this.icon = const Icon(Icons.done),
    this.numberKeyboard,
    this.hintText,
  });

  final TextEditingController nameController;
  final String fieldName;
  final TextStyle textStyle;
  final Icon icon;
  final bool? numberKeyboard;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldName,
          style: textStyle,
        ),
        DetailsTextField(
          numberKeybord: numberKeyboard ?? false,
          controller: nameController,
          hintText: hintText,
        ),
        icon,
      ],
    );
  }
}
