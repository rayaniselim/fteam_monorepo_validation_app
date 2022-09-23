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
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    cardColor: AppColors.colorsBackgroundWhite,
    hintColor: AppColors.colorsHintText,
    focusColor: AppColors.primaryColor,
    errorColor: AppColors.colorsError,
    backgroundColor: AppColors.colorsBackgroundGrey,
  );
}
