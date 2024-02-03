import 'package:bende_fazla/product/enums/app_sizes.dart';
import 'package:flutter/material.dart';

extension CustomSizedBoxExtension on BuildContext {
  SizedBox get sizedBoxWidthLow => SizedBox(width: AppSizes.normal.value);
  SizedBox get sizedBoxWidthNormal => SizedBox(width: AppSizes.high.value);
  SizedBox get sizedBoxWidthMedium => SizedBox(width: AppSizes.ultra.value);

  SizedBox get sizedBoxHeightLow => SizedBox(height: AppSizes.normal.value);
  SizedBox get sizedBoxHeightNormal => SizedBox(height: AppSizes.high.value);
  SizedBox get sizedBoxHeightMedium => SizedBox(height: AppSizes.ultra.value);

  SizedBox get sizedBoxShrink => const SizedBox.shrink();
}
