import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/password_container.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:climbapp/presentation/app/widgets/round_button.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/password/business/cubit/password_cubit.dart';
import 'package:climbapp/presentation/sign_in/widgets/main_stack_card.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _confirmEmailController = TextEditingController();
final _passwordKey = GlobalKey<FormState>();
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
    return BlocProvider(
      create: (context) => passwordLocator<PasswordCubit>(),
      child: Form(
        key: _passwordKey,
        child: Stack(
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
                        icon: const Icon(Icons.email),
                        controller: _emailController),
                    const SizedBox(height: tenPixelsSpaceBetweenWidgets),
                    CTextFormField(
                        textInputWidth: mobileWidth * _marginWidthMultipler,
                        hintText: l10n.mailConfirm,
                        icon: const Icon(Icons.repeat),
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
                child: BlocConsumer<PasswordCubit, PasswordState>(
                  listener: (context, state) {
                    if (state is PasswordSuccess) {
                      // Navigator.pushNamed(context, routeSignInPage);
                      Navigator.of(context).pop();
                    }
                    if (state is PasswordFailed) {
                      context.read<PasswordCubit>().clearState();
                      if (state.exceptionMessage != '') {
                        Utils.showToastMessage(
                          message: Utils().toastExceptionFirebaseMessage(
                            exceptionMessage: state.exceptionMessage,
                            context: context,
                          ),
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<PasswordCubit, PasswordState>(
                      builder: (context, state) {
                        return RoundButton(
                            onTap: () {
                              print('work');

                              context
                                  .read<PasswordCubit>()
                                  .forgottenPassword(_emailController.text);
                            },
                            icon: Icons.mail,
                            iconSize: _roundButtonIconSize,
                            width: _roundButtonWidth);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
