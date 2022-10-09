import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  ThemeData get materialTheme {
    return ThemeData(
      fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      scaffoldBackgroundColor: MyColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.primary,
        primary: MyColors.primary,
        secondary: MyColors.secondary,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: MyColors.text,
        ),
        titleSmall: TextStyle(color: MyColors.text),
        titleMedium: TextStyle(color: MyColors.text),
        bodySmall: TextStyle(color: MyColors.text),
        titleLarge: TextStyle(color: MyColors.text),
        headlineSmall: TextStyle(color: MyColors.text),
        headlineMedium: TextStyle(color: MyColors.text),
      ),
    );
  }
}
