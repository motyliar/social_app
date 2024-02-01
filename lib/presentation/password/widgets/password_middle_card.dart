import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:climbapp/presentation/app/widgets/round_button.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/sign_in/widgets/main_stack_card.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _confirmEmailController = TextEditingController();
const double _buttonWidth = 160;
const double _marginWidthMultipler = 0.6;
const double _roundButtonIconSize = 50;
const double _roundButtonWidth = 90;

class PasswordMiddleCard extends StatelessWidget {
  const PasswordMiddleCard({
    super.key,
    required this.mobileWidth,
    required this.mobileHeight,
  });

  final double mobileWidth;
  final double mobileHeight;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        MainStackCard(appWidth: mobileWidth, appHeight: mobileHeight),
        Positioned(
          top: 0,
          child: StackCenter(
            appWidth: mobileWidth,
            widgetWidth: _buttonWidth,
            child: MidTextButton(
              buttonWidth: _buttonWidth,
              textLabel: l10n.passwordTopLabel,
              textStyle: AppTextStyle.buttonMediumSizeStyle,
            ),
          ),
        ),
        Positioned(
          top: 100,
          child: StackCenter(
            appWidth: mobileWidth,
            widgetWidth: mobileWidth * _marginWidthMultipler,
            child: Column(
              children: [
                CTextFormField(
                    textInputWidth: mobileWidth * _marginWidthMultipler,
                    hintText: l10n.mailEnter,
                    icon: Icon(Icons.email),
                    controller: _emailController),
                SizedBox(height: tenPixelsSpaceBetweenWidgets),
                CTextFormField(
                    textInputWidth: mobileWidth * _marginWidthMultipler,
                    hintText: l10n.mailConfirm,
                    icon: Icon(Icons.repeat),
                    controller: _confirmEmailController)
              ],
            ),
          ),
        ),
        Positioned(
          top: 240,
          child: StackCenter(
            appWidth: mobileWidth,
            widgetWidth: 90,
            child: const RoundButton(
                icon: Icons.mail,
                iconSize: _roundButtonIconSize,
                width: _roundButtonWidth),
          ),
        ),
      ],
    );
  }
}
