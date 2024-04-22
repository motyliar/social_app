import 'package:flutter/material.dart';

class AnimationRoute<T> {
  static Route slideUpRoute(
      {required Widget direction, required String route, arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: route, arguments: arguments),
      pageBuilder: ((context, animation, secondaryAnimation) => direction),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route slideDownRoute(
      {required Widget direction, required String route}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: route),
      pageBuilder: ((context, animation, secondaryAnimation) => direction),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, -1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route rightToLeft({required Widget direction, required String route}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: route),
      pageBuilder: ((context, animation, secondaryAnimation) => direction),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
