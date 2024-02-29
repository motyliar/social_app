import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/button_icon.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeProfilePage),
      builder: (_) => const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: kGeneralPagesMargin,
                ),
                child: RoundBackButton(
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              ButtonIcon(
                  onTap: () =>
                      Navigator.popAndPushNamed(context, routeUserPage),
                  child: AppIcons.personIcon),
            ],
          )
        ],
      ))),
    );
  }
}
