import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

final _loginController = TextEditingController();
final _passwordController = TextEditingController();

class TextFieldColumn extends StatelessWidget {
  const TextFieldColumn({
    super.key,
    required this.textInputWidth,
    required this.l10n,
  });

  final double textInputWidth;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CTextFormField(
          controller: _loginController,
          textInputWidth: textInputWidth,
          hintText: l10n.enterLogin,
          icon: AppIcons.emailIcon,
        ),
        const SizedBox(
          height: tenPixelsSpaceBetweenWidgets,
        ),
        CTextFormField(
            textInputWidth: textInputWidth,
            hintText: l10n.enterPassword,
            icon: AppIcons.passwordIcon,
            controller: _passwordController),
        const SizedBox(
          height: fivePixelsSpaceBetweenWidgets,
        ),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, routePasswordPage),
            child: Text(l10n.forgotPassword,
                style: AppTextStyle.descriptionTextGreySmall))
      ],
    );
  }
}
