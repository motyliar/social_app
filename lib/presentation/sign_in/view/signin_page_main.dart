import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
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
  });

  final double mobileWidth;
  final double mobileHeight;
  final AppLocalizations l10n;
  final TextEditingController passwordController;
  final TextEditingController loginController;

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
                bigLabelText: l10n.topbigLabelText,
                descriptionLabelText: l10n.descriptionLabelText,
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
              top: 400,
              child: Tooltip(
                message: 'this is message',
                child: ElevatedButton(
                  onPressed: () => Utils.customSnackBarWarning(
                      context: context, message: 'message'),
                  child: Text('check'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
