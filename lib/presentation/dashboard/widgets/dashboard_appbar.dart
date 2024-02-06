import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/sign_in/business/sign_in/sign_in_bloc.dart';
import 'package:climbapp/presentation/user/view/user_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/utils.dart';

class DashboardAppBar extends StatelessWidget {
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(maxBorderRadius),
              bottomRight: Radius.circular(maxBorderRadius)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              ImagesURL.signInBottomBackground,
            ),
          )),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(imageSrc),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(userName.capitalize(),
                        style: AppTextStyle.headersAppBar),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, routeFriendsPage),
                        icon: AppIcons.friends),
                    IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, routeMessagePage),
                        icon: AppIcons.messages),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserMainView()));
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
