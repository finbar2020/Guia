import 'package:flutter/material.dart';
import 'package:guia_moteis/core/theme/color_schemes_dev.dart';

class AppTypography {
  static const TextStyle titleMedium = TextStyle(
    fontSize: 22,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w600,
    // color: ColorSchemes.lightColorScheme.onSurfaceVariant,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 13,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w600,
    // color: ColorSchemes.lightColorScheme.onSurfaceVariant,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w400,
    // color: ColorSchemes.lightColorScheme.onSurfaceVariant,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w300,
    // color: ColorSchemes.lightColorScheme.onSurfaceVariant,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 16,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w600,
    // color: ColorSchemes.lightColorScheme.onSurfaceVariant,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w400,
    // color: ColorSchemes.lightColorScheme.onSurfaceVariant,
  );

  static TextStyle loginButtonTextStyle(ThemeData themeData) {
    bool isDark = themeData.brightness == Brightness.dark;

    return TextStyle(
      fontSize: 24.0,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: isDark
          ? ColorSchemes.darkColorSchemeDev.onPrimaryContainer
          : ColorSchemes.lightColorSchemeDev.onPrimary,
    );
  }

  static Color hintColor = ColorSchemes.lightColorSchemeDev.onSurfaceVariant;
}
