import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:flutter/material.dart';

class BigButtonCard extends StatelessWidget {
  const BigButtonCard({
    super.key,
    required this.l10n,
    required this.onTap,
    required this.text,
    this.buttonWidth = 300,
  });

  final AppLocalizations l10n;
  final VoidCallback onTap;
  final double buttonWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ContainerTemplate(
      margin: const EdgeInsets.only(
          left: kGeneralPagesMargin, right: kGeneralPagesMargin),
      padding: const EdgeInsets.only(
        bottom: kGeneralPagesMargin,
      ),
      borderRadius: kMinBorderRadius,
      color: ColorPallete.whiteOpacity80,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          MidTextButton(
              onTap: () => onTap(), buttonWidth: buttonWidth, textLabel: text),
        ],
      ),
    );
  }
}
