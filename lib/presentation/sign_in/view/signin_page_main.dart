import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:flutter/material.dart';

const double _marginFromTop = 0.15;
const double _bothSideMargin = 0.6;
const double _appHeightPrecentMultiplierForMiddleCard = 0.45;

class SignInPageMain extends StatelessWidget {
  const SignInPageMain({
    super.key,
    required this.mobileWidth,
    required this.mobileHeight,
    required this.l10n,
  });

  final double mobileWidth;
  final double mobileHeight;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: mobileWidth,
        height: mobileHeight,
        child: Stack(
          children: [
            BackgroundPainterWidget(size: Size(mobileWidth, mobileHeight)),
            const TopBackgroundImage(),
            Positioned(
              top: mobileWidth * _marginFromTop,
              child: TopLabels(
                bigLabel: l10n.topBigLabel,
                descriptionLabel: l10n.descriptionLabel,
              ),
            ),
            Positioned(
              top: kMarginToStartMiddleForm,
              child: SizedBox(
                height: mobileHeight * _appHeightPrecentMultiplierForMiddleCard,
                child: MiddleLoginCard(
                  appWidth: mobileWidth,
                  appHeight: mobileHeight,
                  textInputWidth: mobileWidth * _bothSideMargin,
                ),
              ),
            ),
            const BottomBackgroundBar(),
            Align(
              alignment: Alignment.bottomRight,
              child: BottomLabel(
                onTap: () => Navigator.pushNamed(context, routeRegisterPage),
                appWidth: mobileWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
