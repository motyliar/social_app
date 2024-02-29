import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:flutter/material.dart';

const double _backgroundImageDimensions = 250.0;
const double _messageRightSidePadding = 50.0;

class WarningSnackBarWidgets extends StatelessWidget {
  const WarningSnackBarWidgets({
    required this.message,
    required this.imageURL,
    super.key,
  });
  final String message;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Image.network(
            imageURL,
            width: _backgroundImageDimensions,
            height: _backgroundImageDimensions,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(right: _messageRightSidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.snackWarningTitle),
                Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class SuccessSnackBarWidgets extends StatelessWidget {
  const SuccessSnackBarWidgets(
      {required this.message,
      super.key,
      this.imageHeight = 50,
      this.snackBarWidth = 130});

  final double imageHeight;
  final double snackBarWidth;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: kMidEmptySpace),
        width: snackBarWidth,
        height: imageHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [downShadow, greyLeftShadow],
          borderRadius: const BorderRadius.all(
            Radius.circular(maxBorderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              message,
              style: AppTextStyle.successSnackBarStyle,
            ),
            const SizedBox(
              width: kMidEmptySpace,
            ),
            Container(
              width: imageHeight,
              height: imageHeight,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(maxBorderRadius)),
                  boxShadow: [
                    downShadow,
                    greyLeftShadow,
                  ]),
              child: Image.network(
                ImagesURL.successSnackBarBackground,
                width: imageHeight,
                height: imageHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
