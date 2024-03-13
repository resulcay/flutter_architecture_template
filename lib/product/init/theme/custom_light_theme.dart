import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pureblog/product/init/theme/custom_color_scheme.dart';
import 'package:pureblog/product/init/theme/custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        colorScheme: CustomColorScheme.lightColorScheme,
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
