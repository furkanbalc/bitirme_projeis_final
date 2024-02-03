import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/progress/custom_centered_circular_progress.dart';
import 'package:flutter/material.dart';

showLoadingDialog({
  required BuildContext context,
  required String message,
}) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: context.borders.circularBorderRadiusHigh),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CustomCenteredCircularProgress(color: AppColors.purpleLight),
                context.sizedBoxWidthMedium,
                Expanded(child: Text(message, style: context.textStyles.titleMedium)),
              ],
            ),
          ],
        ),
      );
    },
  );
}
