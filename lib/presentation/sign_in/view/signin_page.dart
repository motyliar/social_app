import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';

import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

const double _marginFromTop = 0.15;
const double _marginToStartMiddleForm = 250;
const double _bothSideMargin = 0.6;

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeSignInPage),
      builder: (_) => SignInPage(),
    );
  }

  final GlobalKey _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final double mobileHeight = MediaQuery.of(context).size.height;
    final double mobileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: mobileWidth,
          height: mobileHeight,
          child: Stack(
            children: [
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
                top: _marginToStartMiddleForm,
                child: MiddleLoginCard(
                  appWidth: mobileWidth,
                  appHeight: mobileHeight,
                  textInputWidth: mobileWidth * _bothSideMargin,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBackgroundBar(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 20, bottom: 50),
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
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
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(3),
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        gradient: const SweepGradient(
                            center: Alignment.topLeft,
                            colors: [
                              Color(0xFF59D7C8),
                              Color(0xFFA3F264),
                              Color(0xFFF539A8),
                            ]),
                      ),
                      child: Column(children: [
                        Text(
                          'Dont have account yet?',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(fontSize: 14)),
                        ),
                        Text('Sign up')
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Scaffold(
//       backgroundColor: Color(0xFF252E42)),
//       body: SafeArea(
//         child: Column(
//           children: [
//             BlocConsumer<SignInBloc, SignInState>(
//               listener: (context, state) async {
//                 if (state is SignInSuccess) {
//                   if (!_isPageAlreadyOpened) {
//                     context.read<SignInBloc>().add(
//                           CatchUserTokenFromMongoDB(
//                             user: SignInEntity(
//                               email: _userNameController.text,
//                               password: state.user,
//                             ),
//                           ),
//                         );
//                   }
//                 }
//                 if (state is SignInFailed) {
//                   Utils.showToastMessage(
//                     message: Utils().toastExceptionFirebaseMessage(
//                       exceptionMessage: state.exceptionMessage,
//                       context: context,
//                     ),
//                   );
//                 }
//                 if (state is SignInToMongoDB) {
//                   print('this is: ${state.userParams}');
//                   BlocProvider.of<UserBloc>(context)
//                       .add(LoadUserEvent(user: state.userParams));
//                   Utils.showToastMessage(message: 'Login');

//                   await Utils().navigatorClear(
//                       context: context,
//                       routeName: routeDashboardPage,
//                       function: () => context
//                           .read<SignInBloc>()
//                           .add(SignInInitLoadingEvent()));
//                 }
//               },
//               builder: (context, state) {
//                 if (state is SignInToMongoDB) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return Form(
//                   key: _signInKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _userNameController,
//                         decoration: const InputDecoration(
//                           hintText: 'Enter User Name',
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration: const InputDecoration(
//                           hintText: 'Enter a password',
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           print(
//                             "user: ${_userNameController.text} password: ${_passwordController.text} ",
//                           );
//                           context.read<SignInBloc>().add(
//                                 SignInProcess(
//                                   user: SignInEntity(
//                                     email: _userNameController.text,
//                                     password: _passwordController.text,
//                                   ),
//                                 ),
//                               );
//                         },
//                         child: const Text('login'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, routePasswordPage);
//               },
//               child: const Text('Forgot your password?'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, routeRegisterPage);
//               },
//               child: const Text('not account yet? Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Przykładowy kod do zabezpieczenia nawigacji
bool _isPageAlreadyOpened = false;

void navigateToDashboardPage(BuildContext context) {
  if (!_isPageAlreadyOpened) {
    _isPageAlreadyOpened = true;
    Navigator.pushNamed(context, routeDashboardPage).then((_) {
      _isPageAlreadyOpened = false;
    });
  }
}
