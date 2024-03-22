import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WrongPage extends StatelessWidget {
  const WrongPage({required this.l10n, super.key});
  final AppLocalizations l10n;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              RoundBackButton(
                onTap: () =>
                    Navigator.popAndPushNamed(context, routeDashboardPage),
              ),
              const Gap(kGeneralPagesMargin),
              HeadersSmallText(text: l10n.somethingWrong.toUpperCase()),
              const Gap(kGeneralPagesMargin),
              Image.network(ImagesURL.appLogo),
            ],
          ),
        ),
      ),
    );
  }
}
