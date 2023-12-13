import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/sign_in_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/sign_in/datasources/sign_in_remote_data.dart';
import 'package:climbapp/data/sign_in/repository/sign_in_repository_impl.dart';
import 'package:climbapp/domains/sign_in/usecases/log_out_usecase.dart';

import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/business/exports.dart';
import 'package:climbapp/presentation/home/bloc/cubit/sign_out_cubit.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeHomeScreen),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) async {
                  if (state is SignInInitial) {
                    Utils.showToastMessage(message: 'Log Out');
                    await Future<void>.delayed(const Duration(seconds: 1)).then(
                      (value) => Navigator.pushNamed(context, routeSignInPage),
                    );
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {
                          context.read<SignInBloc>().add(LogOut());
                        },
                        child: const Text(
                          'Sign OUT',
                        ),
                      );
                    },
                  );
                },
              ),
              Text(l10n.errorMessage),
              TextButton(
                onPressed: () => context.read<LocaleCubit>().changeLanguage(),
                child: const Text(
                  'language',
                ),
              ),
              TextButton(
                onPressed: () => context.read<ThemeCubit>().changeThemeData(),
                child: const Text(
                  'theme',
                ),
              ),
              BlocBuilder<NetworkBloc, NetworkState>(
                builder: (context, state) {
                  if (state is NetworkInitial) {
                    return const Text('initial');
                  }
                  if (state is NetworkConnected) {
                    return const Text('connected');
                  }
                  if (state is NetworkDisconected) {
                    return const Text('diconnected');
                  } else {
                    return const Text('eroror');
                  }
                },
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, routeRegisterPage),
                child: const Text(
                  'register',
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, routeChangePassword),
                child: const Text('CHANGE PASSWORD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
