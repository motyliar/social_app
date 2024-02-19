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
      children: [
        IconButton(
            onPressed: () => Navigator.pushNamed(context, routeFriendsPage),
            icon: AppIcons.friends),
        IconButton(
            onPressed: () => Navigator.pushNamed(context, routeMessagePage),
            icon: AppIcons.messages),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserMainView()));
            },
            icon: AppIcons.profile),
        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () async {
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
