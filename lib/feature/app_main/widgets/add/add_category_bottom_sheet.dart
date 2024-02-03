import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/constants/app_colors.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/mixin/navigate_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryBottomSheet extends StatelessWidget with NavigatorManager {
  const AddCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<AddProductProvider>();
    final read = context.read<AddProductProvider>();
    return SizedBox(
      height: context.getHeight(factor: .8),
      child: ListView.builder(
        itemCount: watch.categories.length,
        itemBuilder: (context, index) {
          final model = watch.categories[index];
          return InkWell(
            onTap: () {
              read.setCategoryName(model.categoryName ?? '');
              navigatePop(context);
            },
            child: Card(
              color: AppColors.purpleLighter,
              child: Padding(
                padding: context.paddings.verticalHigh,
                child: Text(model.categoryName ?? '', textAlign: TextAlign.center, style: context.textStyles.titleMedium),
              ),
            ),
          );
        },
      ),
    );
  }
}
