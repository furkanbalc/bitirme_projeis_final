import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class UserInfoTitle extends StatelessWidget {
  const UserInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.kUserInfoDesc,
      textAlign: TextAlign.center,
      style: context.textStyles.titleMedium.copyWith(color: AppColors.greyPrimary),
    );
  }
}
