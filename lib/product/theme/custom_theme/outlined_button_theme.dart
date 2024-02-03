import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButtonThemeData {
  CustomOutlinedButtonThemeData._();

  /// Light
  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      foregroundColor: AppColors.purplePrimary,
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.high.value),
        side: const BorderSide(color: AppColors.purplePrimary),
      ),
    ),
  );

  /// Dark
}
