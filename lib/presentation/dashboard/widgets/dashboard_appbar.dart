import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:climbapp/presentation/user/view/user_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/utils.dart';

const double _kAppBarHeight = 130;

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imageSrc;
  final String userName;

  const DashboardAppBar({
    required this.imageSrc,
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(imageSrc),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(userName.capitalize()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, routeFriendsPage),
                      icon: const Icon(
                        Icons.groups,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, routeMessagePage),
                      icon: const Icon(
                        Icons.message,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserMainView()));
                      },
                      icon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () async {
                            context.read<SignInBloc>().add(LogOut());
                            await Utils().navigatorClear(
                              context: context,
                              routeName: routeSignInPage,
                              function: () => Utils.showToastMessage(
                                message: 'logout',
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.logout,
                            size: 20,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_kAppBarHeight);
}
