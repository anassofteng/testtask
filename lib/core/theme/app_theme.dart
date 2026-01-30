import 'package:flutter/material.dart';

import 'app_colors.dart';

/// App-wide theme configuration. Single source of truth for light/dark themes.
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: ColorScheme.dark(
        surface: AppColors.backgroundDark,
        onSurface: Colors.white,
        primary: AppColors.navItemActive,
        onPrimary: AppColors.backgroundDark,
      ),
    );
  }
}
