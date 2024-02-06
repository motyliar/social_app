import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

const double _backgroundImageDimensions = 250.0;
const double _messageRightSidePadding = 50.0;

class WarningSnackBarWidgets extends StatelessWidget {
  const WarningSnackBarWidgets({
    required this.message,
    super.key,
  });
  final String message;

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
            ImagesURL.warningSnackBarBackground,
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
