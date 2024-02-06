import 'package:climbapp/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final headersBig = GoogleFonts.raleway(
      textStyle: const TextStyle(
          fontSize: 30, letterSpacing: 1.5, fontWeight: FontWeight.bold));
  static final descriptionBig = GoogleFonts.raleway(
      textStyle: const TextStyle(
    letterSpacing: 1,
  ));
  static final hintTextStyle = GoogleFonts.raleway(
      textStyle: const TextStyle(fontSize: 12, color: Colors.white));

  static final descriptionTextGreySmall = GoogleFonts.raleway(
      textStyle: const TextStyle(
          fontSize: 12, color: Colors.black, letterSpacing: 0.6));

  static final buttonLabelStyle = GoogleFonts.raleway(
      textStyle: const TextStyle(fontSize: 20, letterSpacing: 0.8));
  static final textFieldStyle =
      GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 14));
  static final buttonMediumSizeStyle =
      GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 14));
  static final buttonSmallSizeStyle =
      GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 10));

  static final successSnackBarStyle = GoogleFonts.raleway(
      textStyle: const TextStyle(fontSize: 16, color: Colors.black));

  static final headersAppBar = GoogleFonts.raleway(
      textStyle: const TextStyle(
          fontSize: 18, color: ColorPallete.mainTextColor, letterSpacing: 0.5));
}
