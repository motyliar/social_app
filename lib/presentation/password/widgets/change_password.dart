import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/password_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/password/entities/password_entity.dart';
import 'package:climbapp/presentation/password/business/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _emailPassword = TextEditingController();
TextEditingController _oldPassword = TextEditingController();
TextEditingController _newPassword = TextEditingController();

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeChangePassword),
      builder: (context) => const ChangePassword(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: BlocProvider(
        create: (context) => passwordLocator<PasswordCubit>(),
        child: SafeArea(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailPassword,
                      decoration: const InputDecoration(hintText: 'EMAIL'),
                    ),
                    TextFormField(
                      controller: _oldPassword,
                      decoration: const InputDecoration(hintText: 'OLD'),
                    ),
                    TextFormField(
                      controller: _newPassword,
                      decoration: const InputDecoration(hintText: 'NEW'),
                    ),
                    BlocConsumer<PasswordCubit, PasswordState>(
                      listener: (context, state) {
                        if (state is PasswordSuccess) {
                          Utils.showToastMessage(message: l10n.successMsg);
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
                        return BlocBuilder<PasswordCubit, PasswordState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () {
                                context.read<PasswordCubit>().changePassword(
                                      PasswordEntity(
                                        oldPassword: _oldPassword.text,
                                        newPassword: _newPassword.text,
                                        userEmail: _emailPassword.text,
                                      ),
                                    );
                              },
                              child: const Text('CHANGE'),
                            );
                          },
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
