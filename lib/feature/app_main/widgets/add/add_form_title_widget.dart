import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AddFormTitleWidget extends StatelessWidget {
  const AddFormTitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.onlyBottomNormal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$title *',
          style: context.textStyles.titleSmall.copyWith(color: AppColors.blackPrimary),
        ),
      ),
    );
  }
}
