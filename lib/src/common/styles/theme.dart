import 'package:flutter/material.dart';

import 'colors.dart';
import 'extentions/custom_button_color.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: LightColors.scaffoldBgColor,
    primaryColor: LightColors.sheetBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: DarkColors.scaffoldBgColor,
      ),
    ),
    colorScheme: const ColorScheme.light(),
    extensions: const <ThemeExtension<dynamic>>[
      CustomButtonColor.light,
    ]
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: DarkColors.scaffoldBgColor,
    primaryColor: DarkColors.sheetBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(),
      extensions: const <ThemeExtension<dynamic>>[
        CustomButtonColor.dark,
      ]
  );
}