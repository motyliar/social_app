import 'package:climbapp/core/constans/router_constans.dart' as route;
import 'package:climbapp/core/error/error_screen.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/view/dashboard_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    debugPrint('${settings.name}');

    switch (settings.name) {
      case route.routeRegisterPage:
        return RegisterPage.route();
      case route.routeSignInPage:
        return SignInPage.route();
      case route.routePasswordPage:
        return PasswordPage.route();
      case route.routeChangePassword:
        return ChangePassword.route();
      case route.routeDashboardPage:
        return DashboardPage.route();
      case route.routeUserPage:
        return UserPage.route();
      case route.routeFriendsPage:
        return FriendsPage.route();
      case route.routeMessagePage:
        return MessageMainView.route();
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic> _errorScreen() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: route.routeErrorScreen),
      builder: (context) =>
          ErrorScreen(error: AppLocalizations.of(context).errorMessage),
    );
  }
}
