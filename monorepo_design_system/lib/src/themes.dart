import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

class AppTheme {
  static final themeLight = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.colorsBackgroundWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.colorsBackgroundGrey,
      iconTheme: IconThemeData(color: AppColors.colorsIconAppBar),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // iconTheme: IconThemeData(color: AppColors.colorsIconGrey), // TODO: NAO ESTA SENDO UTILIZADO
  );

  static final themeDark = ThemeData(
      primaryColor: const Color(0xFF9575CD), brightness: Brightness.dark);
}
