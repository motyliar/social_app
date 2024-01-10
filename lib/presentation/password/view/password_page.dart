import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/get_it/password_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/password/business/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _emailController = TextEditingController();

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
    return BlocProvider(
      create: (context) => passwordLocator<PasswordCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    BlocConsumer<PasswordCubit, PasswordState>(
                      listener: (context, state) {
                        if (state is PasswordSuccess) {
                          Navigator.pushNamed(context, routeSignInPage);
                        }
                        if (state is PasswordFailed) {
                          context.read<PasswordCubit>().clearState();
                          if (state.exceptionMessage != '') {
                            Utils.showToastMessage(
                              message: Utils().toastExceptionFirebaseMessage(
                                exceptionMessage: state.exceptionMessage,
                                context: context,
                              ),
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            context
                                .read<PasswordCubit>()
                                .forgottenPassword(_emailController.text);
                          },
                          child: const Text(
                            'SEND',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
