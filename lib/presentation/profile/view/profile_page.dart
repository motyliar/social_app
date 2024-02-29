import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/button_icon.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.user, super.key});
  static Route<dynamic> route({required FriendsEntity user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: routeProfilePage,
      ),
      builder: (_) => ProfilePage(
        user: user,
      ),
    );
  }

  final FriendsEntity user;

// odnaleźć użytkownika po danych wejściowych
// pobrać jego dane
// wyświetlić

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GradientDivider(
                dividerHeight: 70,
                topMargin: 0,
                bottomMargin: kGeneralPagesMargin,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: fivePixelsSpaceBetweenWidgets,
                      right: kGeneralPagesMargin,
                      left: kGeneralPagesMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundBackButton(
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      ButtonIcon(
                          onTap: () =>
                              Navigator.popAndPushNamed(context, routeUserMain),
                          child: AppIcons.personIcon.copyWith(
                              size: 30,
                              color: ColorPallete.pinkDecorationColor)),
                    ],
                  ),
                ),
              ),
              UserViewCard(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user.profileAvatar),
                    ),
                    SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.userName.capitalize()),
                        ],
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
