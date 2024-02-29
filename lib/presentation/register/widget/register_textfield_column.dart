import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
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
            toolTip: l10n.tipUserName,
            isToolTip: true,
            validator: (value) => FormValidation()
                .userNameValidation(value: value!, context: context),
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.hintUsername,
            icon: AppIcons.personIcon,
            controller: nameController),
        const SizedBox(
          height: kMinEmptySpace,
        ),
        CTextFormField(
            toolTip: l10n.tipEmail,
            isToolTip: true,
            validator: (value) => FormValidation()
                .emailValidation(value: value!, context: context),
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.mailEnter,
            icon: AppIcons.emailIcon,
            controller: emailController),
        const SizedBox(
          height: kMinEmptySpace,
        ),
        CTextFormField(
            toolTip: l10n.tipPassword,
            isToolTip: true,
            obscureText: false,
            validator: (value) => FormValidation().passwordValidation(
                value: value!,
                context: context,
                secondValue: rePasswordController.text),
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.enterPassword,
            icon: AppIcons.passwordIcon,
            controller: passwordController),
        const SizedBox(
          height: kMinEmptySpace,
        ),
        CTextFormField(
            isToolTip: true,
            toolTip: l10n.tipRePassword,
            validator: (value) => FormValidation().passwordValidation(
                value: value!,
                context: context,
                secondValue: passwordController.text),
            obscureText: false,
            textInputWidth: mobileWidth * kMarginMultiplier,
            hintText: l10n.rePassword,
            icon: AppIcons.passwordIcon,
            controller: rePasswordController),
        const SizedBox(
          height: kMinEmptySpace,
        ),
      ],
    );
  }
}
