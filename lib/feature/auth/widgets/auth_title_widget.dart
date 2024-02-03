import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: context.textStyles.headlineSmall.copyWith(
            fontFamily: AppStrings.kSFProFont,
            fontWeight: FontWeight.w500,
            color: AppColors.purplePrimary,
          ),
        ),
        context.sizedBoxHeightLow,
        Text(
          subTitle,
          textAlign: TextAlign.start,
          style: context.textStyles.titleMedium.copyWith(
            fontFamily: AppStrings.kSFProFont,
            color: AppColors.greyPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
