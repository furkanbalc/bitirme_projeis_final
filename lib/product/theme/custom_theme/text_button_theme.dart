import 'package:bende_fazla/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButtonThemeData {
  CustomTextButtonThemeData._();

  /// Light
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      foregroundColor: AppColors.purplePrimary,
    ),
  );

  /// Dark
}
