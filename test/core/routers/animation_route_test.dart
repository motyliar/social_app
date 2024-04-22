import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/routers/animation_route.dart';
import 'package:climbapp/presentation/dashboard/view/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget direction = const DashboardPage();
  String route = routeDashboardPage;
  group("routes", () {
    test("slideUpRoute,should return PageRouteBuilder", () {
      //Act
      final animation =
          AnimationRoute.slideUpRoute(direction: direction, route: route);
      //Assert
      expect(animation, isA<PageRouteBuilder>());
      expect(animation.settings.name, route);
    });
    test("slideDownRoute,should return PageRouteBuilder", () {
      //Act
      final animation =
          AnimationRoute.slideDownRoute(direction: direction, route: route);
      //Assert
      expect(animation, isA<PageRouteBuilder>());
      expect(animation.settings.name, route);
    });
  });
}
