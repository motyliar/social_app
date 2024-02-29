import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
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
    final focusOne = FocusNode();
    final focusTwo = FocusNode();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CTextFormField(
          toolTip: 'Put your userName or Email',
          focusNode: focusOne,
          nextFocus: focusTwo,
          controller: loginController,
          textInputWidth: textInputWidth,
          hintText: l10n.enterLogin,
          icon: AppIcons.emailIcon,
        ),
        const SizedBox(
          height: kMidEmptySpace,
        ),
        CTextFormField(
            toolTip: '',
            focusNode: focusTwo,
            isNextFocus: false,
            obscureText: true,
            textInputWidth: textInputWidth,
            hintText: l10n.enterPassword,
            icon: AppIcons.passwordIcon,
            controller: passwordController),
        const SizedBox(
          height: kMidEmptySpace,
        ),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, routePasswordPage),
            child: Text(l10n.forgotPassword,
                style: AppTextStyle.descriptionTextGreySmall))
      ],
    );
  }
}
