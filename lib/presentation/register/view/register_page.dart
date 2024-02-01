import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/error/error_screen.dart';
import 'package:climbapp/core/services/get_it/register_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/stack_center.dart';
import 'package:climbapp/presentation/register/business/bloc/user_register/user_register_bloc.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _rePasswordController = TextEditingController();
const double _marginFromTop = 0.15;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeRegisterPage),
      builder: (_) => RegisterPage(),
    );
  }

  final _registerKey = GlobalKey<FormState>();

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
              const ArrowBack(),
              const BottomBackgroundBar(),
              Positioned(
                top: kMarginToStartMiddleForm,
                child: SizedBox(
                  height: mobileHeight,
                  child: Stack(children: [
                    MainStackCard(
                      appWidth: mobileWidth,
                      appHeight: mobileHeight,
                      heightMultipler: 0.6,
                    ),
                  ]),
                  // Positioned(
                  //   top: 0,
                  //   child: StackCenter(
                  //       appWidth: mobileWidth,
                  //       widgetWidth: 120,
                  //       child: MidTextButton(
                  //           buttonWidth: 120, textLabel: 'SIGN UP!')),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




//     BlocProvider(
//       create: (context) => registerLocator<UserRegisterBloc>(),
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   BlocConsumer<UserRegisterBloc, UserRegisterState>(
//                     listener: (context, state) {
//                       if (state is ServerFailure) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute<ErrorScreen>(
//                             builder: (context) => const ErrorScreen(
//                               error: 'server failure',
//                             ),
//                           ),
//                         );
//                       }
//                       if (state is UserRegisterLoaded) {
//                         Utils.showToastMessage(
//                           message: l10n.successMsg,
//                         );
//                         context
//                             .read<UserRegisterBloc>()
//                             .add(AddUserToMongoDB(newUser: state.user));
//                         Navigator.popUntil(context, (route) => route.isFirst);
//                       }
//                       if (state is UserRegisterFailure) {
//                         Utils.showToastMessage(
//                           message: Utils().toastExceptionFirebaseMessage(
//                             exceptionMessage: state.exceptionMessage,
//                             context: context,
//                           ),
//                         );
//                       }
//                     },
//                     builder: (context, state) {
//                       return BlocBuilder<UserRegisterBloc, UserRegisterState>(
//                         builder: (context, state) {
//                           return Form(
//                             key: _registerKey,
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   controller: _nameController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'name',
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   controller: _emailController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'email',
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   controller: _passwordController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'password',
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   controller: _rePasswordController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'repassword',
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     if (_registerKey.currentState!.validate()) {
//                                       context.read<UserRegisterBloc>().add(
//                                             AddUserToFireBaseEvent(
//                                               newUser: RegisterEntites(
//                                                 id: kEmptyValue,
//                                                 userEmail:
//                                                     _emailController.text,
//                                                 userName: _nameController.text,
//                                                 password:
//                                                     _passwordController.text,
//                                               ),
//                                             ),
//                                           );
//                                     }
//                                   },
//                                   child: const Text(
//                                     'SIGN UP',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
