import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

class NoticeLogic {
  static bool didIClick(Set<String> idsList, String userId) {
    for (var likes in idsList) {
      if (likes == userId) {
        return true;
      }
    }
    return false;
  }

  static addCommentSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: const BoxDecoration(
          color: ColorPallete.whiteOpacity60,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kMinBorderRadius),
            topRight: Radius.circular(kMinBorderRadius),
          ),
        ),
        child: Column(
          children: [
            const Text('Add comment'),
            const Divider(),
            const Text('Here is your space for comment'),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('back'))
          ],
        ),
      ),
    );
  }
}
