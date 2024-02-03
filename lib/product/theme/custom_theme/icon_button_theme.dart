import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';

class CustomIconButtonTheme {
  CustomIconButtonTheme._();

  /// Light
  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      shadowColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
    ),
  );

  /// Dark
}
