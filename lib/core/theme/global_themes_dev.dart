import 'package:flutter/material.dart';
import 'package:guia_moteis/core/theme/color_schemes_dev.dart';

// ********LIGHT THEME GLOBAL

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorSchemes.lightColorSchemeDev,

  //AppBarTheme

  appBarTheme: AppBarTheme(
    backgroundColor: ColorSchemes.lightColorSchemeDev.outline,
    foregroundColor: ColorSchemes.lightColorSchemeDev.onSecondary,
  ),

  //BOTTOMNAVIGATIONTHEME

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorSchemes.lightColorSchemeDev.outline,
    selectedItemColor: ColorSchemes.lightColorSchemeDev.surfaceContainerHighest,
    unselectedItemColor: ColorSchemes.lightColorSchemeDev.onSurfaceVariant,
  ),

  //CARDTHEME

  cardTheme: CardTheme(
    color: ColorSchemes.lightColorSchemeDev.surfaceContainerHighest,
    elevation: 5,
  ),

  hintColor: ColorSchemes.lightColorSchemeDev.surface,
);

// -----------------------------------------------------------------//

// ********DARK MODE THEME GLOBAL

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorSchemes.darkColorSchemeDev,

  // Appbar TEMA
  appBarTheme: AppBarTheme(
    backgroundColor: ColorSchemes.darkColorSchemeDev.primary,
    foregroundColor: ColorSchemes.darkColorSchemeDev.onPrimary,
  ),

  // BOTTOM NAVIGATION THEME
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorSchemes.darkColorSchemeDev.primary,
    selectedItemColor: ColorSchemes.darkColorSchemeDev.onPrimary,
    unselectedItemColor: ColorSchemes.darkColorSchemeDev.onPrimary,
  ),

  // CARD TEMA
  cardTheme: CardTheme(
    color: ColorSchemes.darkColorSchemeDev.surface,
    elevation: 5,
  ),

  hintColor: ColorSchemes.darkColorSchemeDev.primary,
);
