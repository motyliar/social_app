import 'package:climbapp/core/constans/export_constans.dart';

import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:flutter/material.dart';

const double _marginFromTop = 0.15;
const double _bothSideMargin = 0.6;
const double _appHeightPrecentMultiplierForMiddleCard = 0.7;

class SignInPageMain extends StatelessWidget {
  const SignInPageMain({
    super.key,
    required this.mobileWidth,
    required this.mobileHeight,
    required this.l10n,
    required this.loginController,
    required this.passwordController,
    this.logoWidth = 200,
    this.logoHeight = 150,
    this.logoAngleRotation = 6,
  });

  final double mobileWidth;
  final double mobileHeight;
  final AppLocalizations l10n;
  final TextEditingController passwordController;
  final TextEditingController loginController;
  final double logoWidth;
  final double logoHeight;
  final double logoAngleRotation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: mobileWidth,
        height: mobileHeight,
        child: Stack(
          children: [
            backgroundPainterWidget(size: Size(mobileWidth, mobileHeight)),
            const TopBackgroundImage(),
            Positioned(
              top: 30,
              left: 80,
              child: Transform.rotate(
                angle: logoAngleRotation,
                child: Image.network(
                  ImagesURL.appLogo,
                  width: logoHeight,
                  height: logoWidth,
                ),
              ),
            ),
            Positioned(
              top: kMarginToStartMiddleForm,
              child: SizedBox(
                height: mobileHeight * _appHeightPrecentMultiplierForMiddleCard,
                child: MiddleLoginCard(
                  loginController: loginController,
                  passwordController: passwordController,
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
            Positioned(
              bottom: MediaQuery.of(context).size.height *
                  _logoBottomPositionedMultipler,
              left: _logoLeftPositioned,
              child: Transform.rotate(
                angle: _logoAngleRotate,
                child: Opacity(
                  opacity: _logoOpacity,
                  child: Image.network(
                    ImagesURL.appLogo,
                    width: _logoWidth,
                    height: _logoHeight,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const double _logoBottomPositionedMultipler = 0.3;
const double _logoOpacity = 0.5;
const double _logoLeftPositioned = 10;
const double _logoAngleRotate = 7;
const double _logoHeight = 70;
const double _logoWidth = 100;
