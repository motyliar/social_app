import 'package:climbapp/core/constans/router_constans.dart' as route;
import 'package:climbapp/core/datahelpers/params/message_view.dart';
import 'package:climbapp/core/error/error_screen.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/view/dashboard_page.dart';
import 'package:climbapp/presentation/message/view/message_dist.dart';
import 'package:climbapp/presentation/message/view/message_main.dart';

import 'package:climbapp/presentation/message/view/subview/message_subview.dart';
import 'package:climbapp/presentation/notice/view/comment_main_page.dart';
import 'package:climbapp/presentation/notice/view/notice_main_page.dart';
import 'package:climbapp/presentation/profile/view/profile_page.dart';
import 'package:climbapp/presentation/user/view/user_main_view.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    debugPrint('${settings.name}');

    switch (settings.name) {
      case route.routeRegisterPage:
        return RegisterPage.route();
      case route.routeProfilePage:
        return ProfilePage.route(user: settings.arguments as FriendsEntity);
      case route.routeSignInPage:
        return SignInPage.route();
      case route.routePasswordPage:
        return PasswordPage.route();
      // case route.routeChangePassword:
      //   return ChangePassword.route();
      case route.routeDashboardPage:
        return DashboardPage.route();
      case route.routeUserPage:
        return UserPage.route();
      case route.routeUserMain:
        return UserMainView.route();
      case route.routeFriendsPage:
        return FriendsPage.route();
      case route.routeMessagePage:
        return MessageDistributor.route(
            view: settings.arguments as MessageViewParams);
      case route.routeCreateMessage:
        return CreateNewMessage.route(
            friend: settings.arguments as FriendsEntity);
      case route.routeSingleMessage:
        return MessagePreview.route(
            message: settings.arguments as MessageEntity);
      case route.routeNoticePage:
        return NoticeMainPage.route();
      case route.routeCommentPage:
        return CommentMainPage.route();
      case route.routeCreateNotice:
        return CreateNotice.route();
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
