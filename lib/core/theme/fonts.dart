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
      textStyle: const TextStyle(fontSize: 12, color: Colors.grey));

  static final buttonLabelStyle = GoogleFonts.raleway(
      textStyle: const TextStyle(fontSize: 20, letterSpacing: 0.8));

  static final buttonMediumSizeStyle =
      GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 14));
  static final buttonSmallSizeStyle =
      GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 10));
}
