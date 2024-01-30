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
}
