import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

final _loginController = TextEditingController();
final _passwordController = TextEditingController();

class MiddleLoginCard extends StatelessWidget {
  const MiddleLoginCard({
    required this.textInputWidth,
    super.key,
  });
  final double textInputWidth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height * 0.36,
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
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(4, 4),
                          blurRadius: 14,
                          spreadRadius: 1,
                          color: Colors.grey[500]!.withOpacity(0.8))
                    ]),
                width: 90,
                height: 90,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 7),
                        color: Colors.grey,
                        spreadRadius: 0.2,
                        blurRadius: 20,
                      )
                    ],
                    gradient:
                        const SweepGradient(center: Alignment.topLeft, colors: [
                      Color(0xFFF539A8),
                      Color(0xFFA3F264),
                      Color(0xFF59D7C8),
                    ]),
                  ),
                  child: const Icon(
                    Icons.arrow_right,
                    size: 60,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(4, 4),
                        blurRadius: 14,
                        spreadRadius: 1,
                        color: Colors.grey[500]!.withOpacity(0.8))
                  ]),
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 7),
                      color: Colors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 20,
                    )
                  ],
                  gradient:
                      const SweepGradient(center: Alignment.topLeft, colors: [
                    Color(0xFF59D7C8),
                    Color(0xFFA3F264),
                    Color(0xFFF539A8),
                  ]),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text('LOGIN',
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontSize: 20, letterSpacing: 0.8)))),
              ),
            ),
          ),
          // todo refactoring to single column
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CTextFormField(
                  controller: _loginController,
                  textInputWidth: textInputWidth,
                  hintText: l10n.enterLogin,
                  icon: AppIcons.emailIcon,
                ),
                const SizedBox(
                  height: 10,
                ),
                CTextFormField(
                    textInputWidth: textInputWidth,
                    hintText: l10n.enterPassword,
                    icon: AppIcons.passwordIcon,
                    controller: _passwordController),
                const SizedBox(
                  height: 5,
                ),
                Text(l10n.forgotPassword,
                    style: AppTextStyle.descriptionTextGreySmall)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
