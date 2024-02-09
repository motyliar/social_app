import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class AutoCompleteTextField extends StatelessWidget {
  const AutoCompleteTextField(
      {required this.leftIcon,
      required this.hintText,
      required this.wordsLists,
      super.key});

  final Icon leftIcon;
  final String hintText;
  final List<String> wordsLists;
  static const List<String> popularString = [
    'apple',
    'banana',
    'appBar',
    'chinesse'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return popularString.where((String item) =>
            item.contains(textEditingValue.text.toLowerCase()));
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubbmited) {
        return CTextFormField(
          textInputWidth: 250,
          enableBorders: false,
          hintText: hintText,
          icon: leftIcon,
          controller: textEditingController,
          focusNode: focusNode,
        );
      },
      onSelected: (option) => debugPrint(''),
    );
  }
}
