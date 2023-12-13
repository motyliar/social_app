import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/user/models/user_model.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    final box = Hive.box<UserModel>('user-box');
    final user = box.get(0);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Utils().navigatorClear(context: context, routeName: routeUserPage);

          Navigator.pushNamed(context, routeUserPage);
        },
        child: Icon(Icons.person),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is LoadingFailed) {
                  return Text('Data not loaded');
                }
                if (userState is UserLoaded) {
                  return Column(
                    children: [
                      Text(userState.user.userName.oneLetter(3)),
                      Text(userState.user.userEmail),
                      Text(userState.user.preferences?.language ?? ''),
                      Text(
                        userState.user.preferences?.mode.toString() ??
                            'Nie ma takich rzeczy jeszcze',
                      ),
                      Text(userState.user.profileAvatar ?? 'brak profilu'),
                      Text(userState.user.friends[0]),
                      TextButton(
                        onPressed: () {
                          try {
                            context
                                .read<UserBloc>()
                                .add(LoadUserEvent(user: userState.params!));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('success')));
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          'LOAD NEW DATA',
                        ),
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
                  return const Text('');
                }
              },
            ),
            Text(user?.userName.capitalize() ?? kNoData),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () async {
                    context.read<SignInBloc>().add(LogOut());
                    await Future.delayed(Duration(seconds: 1), () {
                      // Navigator.popUntil(context, (route) => route.isFirst);
                      Utils().navigatorClear(
                        context: context,
                        routeName: routeSignInPage,
                      );
                    });
                  },
                  child: const Text(
                    'Log OUT',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
