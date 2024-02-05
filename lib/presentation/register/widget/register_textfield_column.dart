import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/validation/validations.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterTextFieldStack extends StatelessWidget {
  const RegisterTextFieldStack({
    super.key,
    required this.mobileWidth,
    required this.l10n,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
  });

  final double mobileWidth;
  final AppLocalizations l10n;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CTextFormField(
            validator: (value) => FormValidation()
                .userNameValidation(value: value!, context: context),
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.hintUsername,
            icon: const Icon(Icons.person),
            controller: nameController),
        const SizedBox(
          height: fivePixelsSpaceBetweenWidgets,
        ),
        CTextFormField(
            validator: (value) => FormValidation()
                .emailValidation(value: value!, context: context),
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.mailEnter,
            icon: const Icon(Icons.email),
            controller: emailController),
        const SizedBox(
          height: fivePixelsSpaceBetweenWidgets,
        ),
        CTextFormField(
            obscureText: false,
            validator: (value) => FormValidation().passwordValidation(
                value: value!,
                context: context,
                secondValue: rePasswordController.text),
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.enterPassword,
            icon: const Icon(Icons.password),
            controller: passwordController),
        const SizedBox(
          height: fivePixelsSpaceBetweenWidgets,
        ),
        CTextFormField(
            validator: (value) => FormValidation().passwordValidation(
                value: value!,
                context: context,
                secondValue: passwordController.text),
            obscureText: false,
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.rePassword,
            icon: const Icon(Icons.password),
            controller: rePasswordController),
        const SizedBox(
          height: fivePixelsSpaceBetweenWidgets,
        ),
      ],
    );
  }
}
