import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/firebase/firebase_error/firebase_error.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/snackbars/snackbars.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/smile_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///[EitherFunc] is most usefull in declaration repository functions
typedef EitherFunc<T> = Future<Either<Exception, T>>;

/// Class [Utils] was created for keep usefull function accesible throughout
///  the app

class Utils {
  static void customSnackBarWarning(
      {required BuildContext context, required String message}) {
    final snackBar = AppSnackBarsView(context: context);
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar.warningSnackBar(message: message));
  }

  static void customSnackBarSuccess(
      {required BuildContext context, required String message}) {
    final snackBar = AppSnackBarsView(context: context);
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar.successSnackBar(message: message));
  }

  static Future<dynamic> showSuccessDialog(BuildContext context, Widget child) {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(milliseconds: 750), () {
          Navigator.of(context).pop();
        });
        return child;
      },
    );
  }

  static bool _checkIsToday(String today, String userDate) {
    return today.toLowerCase() == userDate.toLowerCase().cutTo(10);
  }

  static String currentData(String today, String userDate) {
    return !_checkIsToday(today, userDate)
        ? userDate.cutTo(10)
        : userDate.substring(10, 16);
  }

  static void giveLike(BuildContext context, bool didIClick) {
    BlocProvider.of<LikeIconCubit>(context).changeVisible();
    didIClick ? Utils.showSuccessDialog(context, const SmileAnimation()) : null;
  }

  String toastExceptionFirebaseMessage({
    required String exceptionMessage,
    required BuildContext context,
  }) {
    switch (exceptionMessage) {
      case '':
        return '';
      case FirebaseError.invalidEmail:
        return context.l10n.firebaseIncorectEmail;
      case FirebaseError.weakPassword:
        return context.l10n.firebaseWeakPassword;
      case FirebaseError.notAllowed:
        return context.l10n.firebaseOperation;
      case FirebaseError.emailUsed:
        return context.l10n.firebaseUserInBase;
      case FirebaseError.invalidPassword:
        return context.l10n.firebaseWrongPassword;
      case FirebaseError.userDisabled:
        return context.l10n.firebaseUserDisabled;
      case FirebaseError.userNotFound:
        return context.l10n.firebaseUserNotFound;
      case FirebaseError.invalidCredential:
        return context.l10n.firebaseInvalidCredential;
      case FirebaseError.channelError:
        return context.l10n.firebaseEmptyValues;
      case FirebaseError.disconnect:
        return context.l10n.networkDisconnected;
      default:
        return context.l10n.somethingWrong;
    }
  }

  Future<Either<Exception, bool>> checkServerAvailable({
    required http.Client client,
    int durationInSeconds = 10,
  }) async {
    try {
      final result = await client
          .get(Uri.parse(AppUrl.backendUrl + AppUrl.connectionTest))
          .timeout(Duration(seconds: durationInSeconds));
      if (result.statusCode == 200) {
        return const Right(true);
      } else if (result.statusCode != 200) {
        return Left(ServerException.failed());
      }
      return const Right(false);
    } catch (e) {
      return Left(ServerException.failed());
    }
  }

  static void debugError({required Exception error}) {
    debugPrint(
        '\x1B[31m[log] { RUNTIME TYPE: ${error.runtimeType} MESSAGE: $error }\x1B[0m');
  }

  /// [getServerConnection] geter to short response from function above
  EitherFunc<bool> getServerConnection() =>
      checkServerAvailable(client: http.Client());

  ///
  /// [navigatorClear] navigation function with delayed
  Future<void> navigatorClear({
    required BuildContext context,
    required String routeName,
    VoidCallback? function,
  }) async {
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, routeName);
      function?.call();
    });
  }

  static double sizeCalculator(
      {required double totalDimension, required double multipler}) {
    return totalDimension * multipler;
  }

  /// [performNetworkOperation] is short function to check NetworkConnection and
  /// after function check is server available to send request.
  EitherFunc<T> performNetworkOperation<T>(
    EitherFunc<T> Function() operation,
  ) async {
    if (await NetworkConnectedImpl(connectivity: Connectivity()).noConnection) {
      return Left(NetworkException.disconnection());
    } else {
      final serverConnectionTest = await getServerConnection();
      if (serverConnectionTest.isRight()) {
        try {
          return await operation();
        } catch (error) {
          return Left(ServerException(error.toString()));
        }
      } else {
        return Left(ServerException.error());
      }
    }
  }

  static Route animatedRoute(
      {required Widget direction, required String route}) {
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
