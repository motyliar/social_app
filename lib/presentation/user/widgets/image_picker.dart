import 'package:flutter/material.dart';

import '../../../core/theme/themes_export.dart';

void showImagePickerOption(
  BuildContext context,
  VoidCallback onTap,
) {
  showModalBottomSheet(
      backgroundColor: ColorPallete.whiteOpacity80,
      elevation: 0,
      context: context,
      builder: (builder) {
        return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => onTap(),
                  child: const Column(
                    children: [
                      AppIcons.gallery,
                      Text(
                        'Gallery',
                        style: AppTextStyle.descriptionMid,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => onTap(),
                  child: const Column(
                    children: [
                      AppIcons.camera,
                      Text(
                        'Camera',
                        style: AppTextStyle.descriptionMid,
                      )
                    ],
                  ),
                )
              ],
            ));
      });
}
