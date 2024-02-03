import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  /// Light
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.purplePrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.high.value)),
    ),
  );

  /// Dark
}
