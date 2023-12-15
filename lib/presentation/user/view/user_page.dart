import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business/enum.dart';

const double _spaceFromAppBar = 30;
const double _generalPagePadding = 30;

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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _generalPagePadding,
              vertical: _generalPagePadding,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: _spaceFromAppBar,
                  ),
                  Text('My propeteries:'),
                  SizedBox(
                    height: _generalPagePadding,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ViewSwitchCubit>()
                                  .changeStatus(ViewStatus.settings);
                            },
                            child: Text('ACCOUNT SETTINGS')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ViewSwitchCubit>()
                                  .changeStatus(ViewStatus.info);
                            },
                            child: Text('INFO')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ViewSwitchCubit>()
                                  .changeStatus(ViewStatus.sport);
                            },
                            child: Text('MY SPORTS')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ViewSwitchCubit>()
                                  .changeStatus(ViewStatus.notice);
                            },
                            child: Text('MY NOTICE')),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: _generalPagePadding),
                    width:
                        MediaQuery.of(context).size.width - _generalPagePadding,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Recommendations',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text('  4/5 (100)'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('User: Bogdan, 23.08.2023  (5)  '),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                              'Naprawde świetny gość, bardzo polecam, grało mi się z nim świetnie'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            'check more',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
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
              ),
            ),
          );
        } else {
          return Text('error');
        }
      },
    );
  }
}
