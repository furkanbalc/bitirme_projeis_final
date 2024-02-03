import 'package:bende_fazla/product/constants/app_colors.dart';
import 'package:bende_fazla/product/theme/custom_theme/index.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,
    chipTheme: CustomChipTheme.lightChipThemeTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    iconButtonTheme: CustomIconButtonTheme.lightIconButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    textButtonTheme: CustomTextButtonThemeData.lightTextButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonThemeData.lightOutlinedButtonTheme,
  );
}
