import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/error/error_screen.dart';
import 'package:climbapp/core/services/register_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/register/business/bloc/user_register/user_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _rePasswordController = TextEditingController();

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

    return BlocProvider(
      create: (context) => registerLocator<UserRegisterBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  BlocConsumer<UserRegisterBloc, UserRegisterState>(
                    listener: (context, state) {
                      if (state is ServerFailure) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<ErrorScreen>(
                            builder: (context) => const ErrorScreen(
                              error: 'server failure',
                            ),
                          ),
                        );
                      }
                      if (state is UserRegisterLoaded) {
                        Utils.showToastMessage(
                          message: l10n.successMsg,
                        );
                        context
                            .read<UserRegisterBloc>()
                            .add(AddUserToMongoDB(newUser: state.user));
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                      if (state is UserRegisterFailure) {
                        Utils.showToastMessage(
                          message: Utils().toastExceptionFirebaseMessage(
                            exceptionMessage: state.exceptionMessage,
                            context: context,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return BlocBuilder<UserRegisterBloc, UserRegisterState>(
                        builder: (context, state) {
                          return Form(
                            key: _registerKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    hintText: 'name',
                                    border: InputBorder.none,
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'email',
                                    border: InputBorder.none,
                                  ),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    hintText: 'password',
                                    border: InputBorder.none,
                                  ),
                                ),
                                TextFormField(
                                  controller: _rePasswordController,
                                  decoration: const InputDecoration(
                                    hintText: 'repassword',
                                    border: InputBorder.none,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (_registerKey.currentState!.validate()) {
                                      context.read<UserRegisterBloc>().add(
                                            AddUserToFireBaseEvent(
                                              newUser: RegisterEntites(
                                                id: kEmptyValue,
                                                userEmail:
                                                    _emailController.text,
                                                userName: _nameController.text,
                                                password:
                                                    _passwordController.text,
                                              ),
                                            ),
                                          );
                                    }
                                  },
                                  child: const Text(
                                    'SIGN UP',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
