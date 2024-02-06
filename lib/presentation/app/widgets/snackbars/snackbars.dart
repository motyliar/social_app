import 'package:climbapp/presentation/app/widgets/snackbars/info_snackbar.dart';
import 'package:climbapp/presentation/app/widgets/snackbars/warning_snackbar.dart';
import 'package:flutter/material.dart';

const double _snackBarHeightViewMultipler = 0.65;

class AppSnackBarsView {
  const AppSnackBarsView({required this.context});
  final BuildContext context;

  SnackBar warningSnackBar({required String message}) {
    return AppSnackBar(
      context: context,
      content: WarningSnackBarWidgets(
        message: message,
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height *
              _snackBarHeightViewMultipler),
    );
  }
}
