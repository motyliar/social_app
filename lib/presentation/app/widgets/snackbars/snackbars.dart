import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/app/widgets/snackbars/info_snackbar.dart';
import 'package:climbapp/presentation/app/widgets/snackbars/warning_snackbar.dart';
import 'package:flutter/material.dart';

class AppSnackBarsView {
  const AppSnackBarsView({required this.context});
  final BuildContext context;

  SnackBar warningSnackBar({required String message}) {
    return AppSnackBar(
      context: context,
      content: WarningSnackBarWidgets(
        imageURL: ImagesURL.warningSnackBarBackground,
        message: message,
      ),
    );
  }

  SnackBar successSnackBar({required String message}) {
    return AppSnackBar(
      context: context,
      content: SuccessSnackBarWidgets(
        message: message.capitalize(),
      ),
    );
  }
}
