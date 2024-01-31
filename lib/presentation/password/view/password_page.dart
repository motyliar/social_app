import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/password_container.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/password/business/cubit/password_cubit.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _emailController = TextEditingController();
const double _marginFromTop = 0.15;
const double _textFieldTopMargin = 250;

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routePasswordPage),
      builder: (_) => const PasswordPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mobileWidth = MediaQuery.of(context).size.width;
    final mobileHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: mobileWidth,
        height: mobileHeight,
        child: Stack(children: [
          BackgroundPainterWidget(size: Size(mobileWidth, mobileHeight)),
          const TopBackgroundImage(),
          Positioned(
            top: mobileWidth * _marginFromTop,
            child: TopLabels(
              bigLabel: l10n.topBigLabel,
              descriptionLabel: l10n.descriptionLabel,
            ),
          ),
          Positioned(
            top: _textFieldTopMargin,
            child: SizedBox(
              height: mobileHeight * 0.40,
              child: Stack(
                children: [
                  MainStackCard(appWidth: mobileWidth, appHeight: mobileHeight),
                  Positioned(
                    top: 0,
                    child: StackCenter(
                      appWidth: mobileWidth,
                      widgetWidth: 160,
                      child: MidTextButton(
                        buttonWidth: 160,
                        textLabel: 'FORGOT PASSWORD?',
                        textStyle: AppTextStyle.buttonMediumSizeStyle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: StackCenter(
                      appWidth: mobileWidth,
                      widgetWidth: mobileWidth * 0.6,
                      child: Column(
                        children: [
                          CTextFormField(
                              textInputWidth: mobileWidth * 0.6,
                              hintText: 'type email',
                              icon: Icon(Icons.email),
                              controller: _emailController),
                          SizedBox(height: tenPixelsSpaceBetweenWidgets),
                          CTextFormField(
                              textInputWidth: mobileWidth * 0.6,
                              hintText: 'repeat email',
                              icon: Icon(Icons.repeat),
                              controller: _emailController)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 240,
                    child: StackCenter(
                      appWidth: mobileWidth,
                      widgetWidth: 90,
                      child: RoundButton(
                          icon: Icons.mail, iconSize: 50, width: 90),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomBackgroundBar(),
          ),
        ]),
      ),
    ));
  }
}


// BlocProvider(
//       create: (context) => passwordLocator<PasswordCubit>(),
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Form(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         hintText: 'Email',
//                       ),
//                     ),
//                     BlocConsumer<PasswordCubit, PasswordState>(
//                       listener: (context, state) {
//                         if (state is PasswordSuccess) {
//                           Navigator.pushNamed(context, routeSignInPage);
//                         }
//                         if (state is PasswordFailed) {
//                           context.read<PasswordCubit>().clearState();
//                           if (state.exceptionMessage != '') {
//                             Utils.showToastMessage(
//                               message: Utils().toastExceptionFirebaseMessage(
//                                 exceptionMessage: state.exceptionMessage,
//                                 context: context,
//                               ),
//                             );
//                           }
//                         }
//                       },
//                       builder: (context, state) {
//                         return TextButton(
//                           onPressed: () {
//                             context
//                                 .read<PasswordCubit>()
//                                 .forgottenPassword(_emailController.text);
//                           },
//                           child: const Text(
//                             'SEND',
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

