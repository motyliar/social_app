import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/firebase/firebase_error/firebase_error.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/snackbars/snackbars.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/smile_animation.dart';
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

  static void giveLike(BuildContext context, bool didIClick) {
    print(didIClick);
    BlocProvider.of<LikeIconCubit>(context).changeVisible();
    didIClick ? Utils.showSuccessDialog(context, const SmileAnimation()) : null;
  }

  /// Function [toastExceptionFirebaseMessage] using for showing exception
  /// message cought from FireBaseAuthException. switch-case is needed for
  /// sending properly l10n [exceptionMessage]
  /// The [FirebaseError] store every constant string with an error message
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

  /// [checkServerAvailable] tests connection to the server before sending
  /// a request to check if is server live
  /// [durationInSeconds] are used to set server TimeOut.
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
    print(
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

  /// [performNetworkOperation] is short function to check NetworkConnection and
  /// after function check is server available to send request.
  EitherFunc<T> performNetworkOperation<T>(
    EitherFunc<T> Function() operation,
  ) async {
    if (await NetworkConnectedImpl().noConnection) {
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
}
