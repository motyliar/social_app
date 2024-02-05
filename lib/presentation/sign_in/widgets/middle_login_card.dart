import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _buttonWidth = 100;
final _loginKey = GlobalKey<FormState>();
const double _textFieldsTopMargin = 80;
const double _roundButtonTopMargin = 260;

class MiddleLoginCard extends StatelessWidget {
  const MiddleLoginCard({
    required this.textInputWidth,
    required this.appWidth,
    required this.appHeight,
    this.roundButtonWidth = 90,
    required this.loginController,
    required this.passwordController,
    this.iconSize = 60,
    super.key,
  });
  final double textInputWidth;
  final double appWidth;
  final double appHeight;
  final double roundButtonWidth;
  final double iconSize;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: _loginKey,
      child: Stack(
        children: [
          MainStackCard(appWidth: appWidth, appHeight: appHeight),
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
                child: TextFieldColumn(
                  textInputWidth: textInputWidth,
                  l10n: l10n,
                  loginController: loginController,
                  passwordController: passwordController,
                ),
              )),
          Positioned(
              top: _roundButtonTopMargin,
              child: StackCenter(
                appWidth: appWidth,
                widgetWidth: roundButtonWidth,
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return RoundButton(
                      onTap: () {
                        if (_loginKey.currentState!.validate()) {
                          context.read<SignInBloc>().add(
                                SignInProcess(
                                  user: SignInEntity(
                                    email: loginController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          print('no entry');
                        }
                      },
                      width: roundButtonWidth,
                      icon: Icons.navigate_next,
                      iconSize: iconSize,
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
