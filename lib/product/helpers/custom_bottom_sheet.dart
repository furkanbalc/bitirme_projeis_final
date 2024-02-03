import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/material.dart';

customBottomSheet({
  required BuildContext context,
  required String title,
  required Widget body,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              context.sizedBoxWidthNormal,
              Text(
                title,
                style: context.textStyles.titleLarge.copyWith(color: AppColors.blackPrimary, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              CustomIconButton(onPressed: () => Navigator.pop(context), icon: Icons.close, iconColor: AppColors.blackPrimary),
              context.sizedBoxHeightLow,
            ],
          ),
          Divider(color: AppColors.blackPrimary.withOpacity(0.3)),
          context.sizedBoxHeightLow,
          Padding(
            padding: context.paddings.horizontalMedium,
            child: body,
          ),
          context.sizedBoxHeightNormal,
        ],
      );
    },
  );
}
