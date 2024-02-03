import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class ProfileStatisticDetailWidget extends StatelessWidget {
  const ProfileStatisticDetailWidget({
    super.key,
    required this.value,
    required this.text,
  });

  final int value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.blackPrimary),
        ),
        Padding(
          padding: context.paddings.horizontalLow,
          child: const Divider(color: AppColors.blackPrimary),
        ),
        Text('$value', style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
