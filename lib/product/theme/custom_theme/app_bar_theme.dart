import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  /// Light
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: kAppBarFontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.blackPrimary,
    ),
    iconTheme: IconThemeData(color: AppColors.blackPrimary, size: kAppBarIconSize),
    actionsIconTheme: IconThemeData(color: AppColors.blackPrimary, size: kAppBarIconSize),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  /// Dark
}
