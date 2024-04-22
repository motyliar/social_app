import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/routers/app_router.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const route = routeDashboardPage;
  group("onGenerateRoute", () {
    test("on Generate Route, should return Route<dynamic>", () {
      //Act
      final router =
          AppRouter.onGenerateRoute(const RouteSettings(name: route));
      //Assert
      expect(router, isA<Route<dynamic>>());
      expect(router.settings.name, routeDashboardPage);
    });

    test("OnGenerateRoute, when incorrect input should return ErrorPage", () {
      //Act
      final router =
          AppRouter.onGenerateRoute(const RouteSettings(name: "unknown"));
      print(router);
      expect(router, isA<Route<dynamic>>());
      expect(router.settings.name, "errorScreen");
    });

    test(
        "OnGenerateRoute, when correct input include arguments should return correctPage",
        () {
      //Arrange
      const page = routeCreateMessage;
      const friends = FriendsEntity(
          id: '1',
          userName: 'TestName',
          profileAvatar: 'profileAvatar',
          isActive: true,
          lastLoggedIn: 'date');
      //Act
      final router = AppRouter.onGenerateRoute(
          const RouteSettings(name: page, arguments: friends));

      expect(router, isA<Route<dynamic>>());
      expect(router.settings.name, routeCreateMessage);
      expect(router.settings.arguments, friends);
    });
  });
}
