import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/helpers/custom_bottom_sheet.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFormCategory extends StatelessWidget {
  const AddFormCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<AddProductProvider>();
    final categoryName = context.watch<AddProductProvider>().productCategory;

    return Column(
      children: [
        const AddFormTitleWidget(title: AppStrings.kAddFormCategory),
        CustomOutlinedButton(
          width: double.infinity,
          buttonTitle: categoryName.isNotEmpty ? categoryName : AppStrings.kAddFormCategory,
          onPressed: () async {
            await read.getCategories();
            // ignore: use_build_context_synchronously
            customBottomSheet(context: context, title: 'Kategori seçimi', body: const AddCategoryBottomSheet());
          },
          butonColor: AppColors.purpleLight,
        ),
      ],
    );
  }
}
