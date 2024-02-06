import 'package:climbapp/presentation/app/widgets/snackbars/warning_snackbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  const AppSnackBar(
      {required this.context,
      required super.content,
      super.backgroundColor = Colors.transparent,
      super.behavior = SnackBarBehavior.floating,
      super.elevation = 0,
      super.margin,
      super.key});
  final BuildContext context;
}
