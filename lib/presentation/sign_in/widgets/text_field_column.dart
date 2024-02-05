import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class TextFieldColumn extends StatelessWidget {
  const TextFieldColumn({
    super.key,
    required this.textInputWidth,
    required this.l10n,
    required this.loginController,
    required this.passwordController,
  });

  final double textInputWidth;
  final AppLocalizations l10n;
  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CTextFormField(
          validator: (value) {
            if (value == '') {
              return 'żle';
            } else if (!RegExp(r'^[a-zA-Z0-9]').hasMatch(value!)) {
              return 'Dobrze';
            } else {
              return null;
            }
          },
          controller: loginController,
          textInputWidth: textInputWidth,
          hintText: l10n.enterLogin,
          icon: AppIcons.emailIcon,
        ),
        const SizedBox(
          height: tenPixelsSpaceBetweenWidgets,
        ),

        // todo

        /* 
        Należy tutaj zaimplementować validacje do wpisywanych text fieldów 
        - Najlepiej gdyby zrobić osobne funcke w klasie Validate
        - Do każdej validacji należy zaimplementować osobny proces
        - Dodatkowo wszystkie tłumaczenia wprowadzić to international
        - Zmodyfikować podkreślenie
        - 
        */

        CTextFormField(
            validator: (value) {
              if (value == '') {
                return l10n.errorMessage;
              } else if (!RegExp(r'^[a-zA-Z0-9]').hasMatch(value!)) {
                return 'Dobrze';
              } else {
                return null;
              }
            },
            obscureText: true,
            textInputWidth: textInputWidth,
            hintText: l10n.enterPassword,
            icon: AppIcons.passwordIcon,
            controller: passwordController),
        const SizedBox(
          height: tenPixelsSpaceBetweenWidgets,
        ),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, routePasswordPage),
            child: Text(l10n.forgotPassword,
                style: AppTextStyle.descriptionTextGreySmall))
      ],
    );
  }
}
