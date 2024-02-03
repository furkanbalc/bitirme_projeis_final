import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

showErrorSnackBar({required BuildContext context, required String message}) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Padding(
      padding: context.paddings.allMedium,
      child: Row(
        children: [
          const Icon(Iconsax.warning_25, color: AppColors.whiteColor),
          context.sizedBoxWidthMedium,
          Text(message),
        ],
      ),
    ),
    width: context.getWidth(factor: .9),
    padding: context.paddings.horizontalMedium,
    backgroundColor: AppColors.redColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
