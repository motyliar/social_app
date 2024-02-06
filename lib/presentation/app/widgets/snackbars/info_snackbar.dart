import 'package:climbapp/presentation/app/widgets/snackbars/warning_snackbar.dart';
import 'package:flutter/material.dart';

class InfoSnackBar extends StatelessWidget {
  const InfoSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.7),
        content: const WarningSnackBarWidgets());
  }
}

class AppSnackBar extends SnackBar {
  const AppSnackBar(
      {required this.context,
      required super.content,
      super.backgroundColor = Colors.transparent,
      super.behavior = SnackBarBehavior.floating,
      super.margin,
      super.key});
  final BuildContext context;
}
