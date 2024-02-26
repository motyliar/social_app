import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:climbapp/presentation/user/view/user_main_view.dart';
import 'package:flutter/material.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({
    required this.controller,
    super.key,
  });
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarIcons(
            onTap: () => Navigator.pushNamed(context, routeFriendsPage),
            icon: AppIcons.friends),
        AppBarIcons(
            onTap: () => Navigator.pushNamed(context, routeMessagePage),
            icon: AppIcons.messages),
        AppBarIcons(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserMainView()));
            },
            icon: AppIcons.profile),
        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return AppBarIcons(
                onTap: () async {
                  context.read<SignInBloc>().add(LogOut());
                  await Utils().navigatorClear(
                    context: context,
                    routeName: routeSignInPage,
                    function: () => Utils.customSnackBarSuccess(
                      context: context,
                      message: 'logout',
                    ),
                  );
                },
                icon: AppIcons.logout);
          },
        ),
      ],
    );
  }
}

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    required this.onTap,
    required this.icon,
    this.padding = const EdgeInsets.only(right: 8.0),
    super.key,
  });

  final VoidCallback onTap;
  final Icon icon;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(onTap: () => onTap(), child: icon),
    );
  }
}
