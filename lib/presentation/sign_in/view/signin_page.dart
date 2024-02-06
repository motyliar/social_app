import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController _loginController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _isPageAlreadyOpened = false;

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeSignInPage),
      builder: (_) => const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final double mobileHeight = MediaQuery.of(context).size.height;
    final double mobileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) async {
      if (state is SignInSuccess) {
        if (!_isPageAlreadyOpened) {
          context.read<SignInBloc>().add(
                CatchUserTokenFromMongoDB(
                  user: SignInEntity(
                    email: _loginController.text,
                    password: state.user,
                  ),
                ),
              );
        }
      }
      if (state is SignInFailed) {
        final message = Utils().toastExceptionFirebaseMessage(
            exceptionMessage: state.exceptionMessage, context: context);
        Utils.customSnackBarWarning(context: context, message: message);
      }
      if (state is SignInToMongoDB) {
        BlocProvider.of<UserBloc>(context).add(
          LoadUserEvent(
            user: state.userParams,
          ),
        );
        Utils.customSnackBarWarning(
          context: context,
          message: 'Login',
        );

        await Utils().navigatorClear(
          context: context,
          routeName: routeDashboardPage,
          function: () => context.read<SignInBloc>().add(
                SignInInitLoadingEvent(),
              ),
        );
      }
    }, builder: (context, state) {
      if (state is SignInToMongoDB) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SignInPageMain(
        loginController: _loginController,
        passwordController: _passwordController,
        mobileWidth: mobileWidth,
        mobileHeight: mobileHeight,
        l10n: l10n,
      );
    }));
  }
}
