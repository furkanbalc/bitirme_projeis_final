import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';

class AppBoxDecoration {
  static final BoxDecoration onboardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: AppColors.purplePrimary,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 1,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static final BoxDecoration welcomeDecorations = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: AppColors.purplePrimary,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
