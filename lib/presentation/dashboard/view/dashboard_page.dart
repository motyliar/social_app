import 'package:climbapp/core/constans/router_constans.dart';

import 'package:climbapp/presentation/app/business/cubit/theme/theme_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeDashboardPage),
      builder: (_) => DashboardPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserLoaded) {
                context.read<ThemeCubit>().changeThemeData(
                      mode: state.user.preferences?.mode ?? false,
                    );
                print(state.user.preferences?.mode.toString());
              }
            },
            builder: (context, state) {
              return BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                if (state is UserLoaded) {
                  context.read<ThemeCubit>().changeThemeData(
                        mode: state.user.preferences?.mode ?? false,
                      );
                  return DashboardAppBar(
                      imageSrc: state.user.profileAvatar!,
                      userName: state.user.userName);
                }
                return Text('failed');
              });
            },
          )
        ],
      )),
    );
  }
}
