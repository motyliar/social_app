import 'package:climbapp/core/l10n/l10n.dart';

import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';

import 'package:flutter/material.dart';

const double _buttonWidth = 100;
const double _buttonHeight = 40;
const double _40procentOfSize = 40;

class MiddleLoginCard extends StatelessWidget {
  const MiddleLoginCard({
    required this.textInputWidth,
    required this.appWidth,
    required this.appHeight,
    super.key,
  });
  final double textInputWidth;
  final double appWidth;
  final double appHeight;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: appWidth,
      height: appHeight * _40procentOfSize,
      child: Stack(
        children: [
          SizedBox(
            width: appWidth,
            child: Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              width: appWidth - 50,
              height: appHeight * 0.36,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(5, -4),
                        blurRadius: 16,
                        spreadRadius: 1,
                        color: Colors.grey[500]!.withOpacity(0.5)),
                    BoxShadow(
                        offset: const Offset(-5, 5),
                        blurRadius: 12,
                        spreadRadius: 1,
                        color: Colors.grey[500]!.withOpacity(0.5))
                  ]),
              child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.grey.withOpacity(0.2),
                      Colors.white
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 240,
              child: StackCenter(
                appWidth: appWidth,
                widgetWidth: 90,
                child: const RoundButton(
                  width: 90,
                  icon: Icons.navigate_next,
                  iconSize: 60,
                ),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: MidTextButton(
              buttonWidth: _buttonWidth,
              buttonHeight: _buttonHeight,
              textLabel: l10n.login.toUpperCase(),
            ),
          ),
          Positioned(
              top: 80,
              child: StackCenter(
                appWidth: appWidth,
                widgetWidth: textInputWidth,
                child:
                    TextFieldColumn(textInputWidth: textInputWidth, l10n: l10n),
              )),
        ],
      ),
    );
  }
}
