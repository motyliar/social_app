import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/presentation/sign_in/widgets/background_painter.dart';
import 'package:climbapp/presentation/sign_in/widgets/background_widget.dart';
import 'package:climbapp/presentation/sign_in/widgets/top_background_bar.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeSignInPage),
      builder: (_) => SignInPage(),
    );
  }

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                top: mobileWidth * 0.15,
                child: Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JoinMee',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 30,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          'App for SportLovers',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                            letterSpacing: 1,
                          )),
                        ),
                      ],
                    )),
              ),
              Positioned(
                top: 250,
                child: SizedBox(
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
                                gradient: const SweepGradient(
                                    center: Alignment.topLeft,
                                    colors: [
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
                              gradient: const SweepGradient(
                                  center: Alignment.topLeft,
                                  colors: [
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
                                            fontSize: 20,
                                            letterSpacing: 0.8)))),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Enter your login',
                                    hintStyle: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Color(0xFF59D7C8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(
                                            color: Colors.grey[500]!
                                                .withOpacity(0.5))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(
                                            color: Colors.grey[500]!
                                                .withOpacity(0.5)))),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    hintStyle: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                    prefixIcon: const Icon(
                                      Icons.password,
                                      color: Color(0xFF59D7C8),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(
                                            color: Colors.grey[500]!
                                                .withOpacity(0.5)))),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Forgot password?',
                              style: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                      'http://motyliar.webd.pro/social/bottom_background.jpg'),
                ),
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
              // todo poprawić skalowalność przycisku dont have account yet
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
