import 'package:climbapp/core/constans/app_sizing_const.dart';
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
const double _bothSideMargin = 0.6;

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeSignInPage),
      builder: (_) => SignInPage(),
    );
  }

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
                top: kMarginToStartMiddleForm,
                child: SizedBox(
                  height: mobileHeight * 0.45,
                  child: MiddleLoginCard(
                    appWidth: mobileWidth,
                    appHeight: mobileHeight,
                    textInputWidth: mobileWidth * _bothSideMargin,
                  ),
                ),
              ),
              const BottomBackgroundBar(),
              Align(
                alignment: Alignment.bottomRight,
                child: BottomLabel(
                  onTap: () => Navigator.pushNamed(context, routeRegisterPage),
                  appWidth: mobileWidth,
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
