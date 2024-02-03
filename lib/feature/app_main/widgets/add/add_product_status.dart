import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/helpers/custom_bottom_sheet.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductStatus extends StatelessWidget {
  const AddProductStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final productStatus = context.watch<AddProductProvider>().productStatus;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            ' ${AppStrings.kAddFormProductStatus} *',
            style: context.textStyles.titleSmall.copyWith(color: AppColors.blackPrimary),
          ),
        ),
        context.sizedBoxHeightLow,
        CustomElevatedButton(
          backgroundColor: AppColors.purpleLight,
          onPressed: () {
            customBottomSheet(
              context: context,
              title: AppStrings.kAddFormProductStatus,
              body: const AddProductStatusBottomSheet(),
            );
          },
          text: productStatus.isNotEmpty ? productStatus : AppStrings.kAddFormProductStatus,
        ),
      ],
    );
  }
}
