import 'package:bende_fazla/product/enums/app_sizes.dart';
import 'package:flutter/material.dart';

extension CustomBordersExtension on BuildContext {
  CustomBorders get borders => CustomBorders(this);
}

class CustomBorders {
  final BuildContext context;
  CustomBorders(this.context);

  Radius get radiusLow => Radius.circular(AppSizes.low.value);
  Radius get radiusNormal => Radius.circular(AppSizes.normal.value);
  Radius get radiusMedium => Radius.circular(AppSizes.medium.value);
  Radius get radiusHigh => Radius.circular(AppSizes.high.value);

  BorderRadius get circularBorderRadiusLow => BorderRadius.circular(AppSizes.low.value);
  BorderRadius get circularBorderRadiusNormal => BorderRadius.circular(AppSizes.normal.value);
  BorderRadius get circularBorderRadiusMedium => BorderRadius.circular(AppSizes.medium.value);
  BorderRadius get circularBorderRadiusHigh => BorderRadius.circular(AppSizes.high.value);
}
