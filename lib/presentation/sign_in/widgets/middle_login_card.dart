import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';

import 'package:flutter/material.dart';

const double _buttonWidth = 100;

const double _textFieldsTopMargin = 80;
const double _roundButtonTopMargin = 240;

class MiddleLoginCard extends StatelessWidget {
  const MiddleLoginCard({
    required this.textInputWidth,
    required this.appWidth,
    required this.appHeight,
    this.roundButtonWidth = 90,
    this.iconSize = 60,
    super.key,
  });
  final double textInputWidth;
  final double appWidth;
  final double appHeight;
  final double roundButtonWidth;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        MainStackCard(appWidth: appWidth, appHeight: appHeight),
        Positioned(
            top: _roundButtonTopMargin,
            child: StackCenter(
              appWidth: appWidth,
              widgetWidth: roundButtonWidth,
              child: RoundButton(
                onTap: () => Navigator.pushNamed(context, routePasswordPage),
                width: roundButtonWidth,
                icon: Icons.navigate_next,
                iconSize: iconSize,
              ),
            )),
        Positioned(
          top: 0,
          child: StackCenter(
            appWidth: appWidth,
            widgetWidth: _buttonWidth,
            child: MidTextButton(
              buttonWidth: _buttonWidth,
              textLabel: l10n.login.toUpperCase(),
            ),
          ),
        ),
        Positioned(
            top: _textFieldsTopMargin,
            child: StackCenter(
              appWidth: appWidth,
              widgetWidth: textInputWidth,
              child:
                  TextFieldColumn(textInputWidth: textInputWidth, l10n: l10n),
            )),
      ],
    );
  }
}
