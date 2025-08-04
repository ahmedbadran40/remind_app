import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reminde_app/core/constants/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightScaffold,
    cardColor: lightCard,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkScaffold,
    cardColor: darkCard,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  );
}
