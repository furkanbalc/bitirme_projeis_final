import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  /// Light
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: AppColors.greyPrimary,
    suffixIconColor: AppColors.greyPrimary,
    filled: true,
    fillColor: AppColors.greyLighter,
    labelStyle: const TextStyle().copyWith(fontSize: kTextFieldFontSizes, color: AppColors.blackPrimary),
    hintStyle: const TextStyle().copyWith(fontSize: kTextFieldFontSizes, color: AppColors.greyPrimary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.blackPrimary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.high.value),
      borderSide: const BorderSide(width: kTextFieldBorderWidth, color: AppColors.greyPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.high.value),
      borderSide: const BorderSide(width: kTextFieldBorderWidth, color: AppColors.greyPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.high.value),
      borderSide: const BorderSide(width: kTextFieldBorderWidth, color: AppColors.purplePrimary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.high.value),
      borderSide: const BorderSide(width: kTextFieldBorderWidth, color: AppColors.redColor),
    ),
  );

  /// Dark
}
