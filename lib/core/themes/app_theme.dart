import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      primaryColor: kBlue,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.lato(
          color: kBlack,
          fontWeight: FontWeight.w600,
          fontSize: kDimens16
        ),
        bodyMedium: GoogleFonts.lato(
            color: kBlack,
            fontWeight: FontWeight.w600,
            fontSize: kDimens14
        ),
        bodySmall: GoogleFonts.lato(
            color: kBlack,
            fontWeight: FontWeight.w300,
            fontSize: kDimens12
        ),
        headlineSmall: GoogleFonts.lato(
            color: kBlack,
            fontWeight: FontWeight.w600,
            fontSize: kDimens20
        ),
      )
    );
  }
}