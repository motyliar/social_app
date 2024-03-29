import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/constans/export_constans.dart';

class TopNotifyBar extends StatelessWidget {
  const TopNotifyBar(
      {super.key, required this.text, this.onBack, this.height = 100});

  final String text;
  final VoidCallback? onBack;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            midBorderRadius,
          ),
          bottomLeft: Radius.circular(
            midBorderRadius,
          ),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            ImagesURL.signInBottomBackground,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kGeneralPagesMargin),
            child: RoundBackButton(
              onTap: () =>
                  onBack == null ? Navigator.of(context).pop() : onBack!(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kGeneralPagesMargin),
            child: Text(text,
                style: AppTextStyle.headersBig
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
