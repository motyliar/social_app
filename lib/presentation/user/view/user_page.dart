import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/user/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeUserPage),
      builder: (_) => const UserPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Column(
              children: [
                Text(state.user.userName),
                Text(
                  state.user.userEmail,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'BACK',
                  ),
                ),
              ],
            );
          } else {
            return Text('Default');
          }
        },
      )),
    );
  }
}
