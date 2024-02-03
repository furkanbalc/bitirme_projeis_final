import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetTheme {
  CustomBottomSheetTheme._();

  /// Light
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.whiteColor,
    modalBackgroundColor: AppColors.whiteColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.high.value))),
  );

  /// Dark
}
