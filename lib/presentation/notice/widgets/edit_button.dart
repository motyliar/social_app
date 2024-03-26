import 'package:flutter/widgets.dart';

import '../../../core/theme/themes_export.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Text(
        text,
        style: AppTextStyle.descriptionMid,
      ),
    );
  }
}
