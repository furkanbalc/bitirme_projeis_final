import 'package:bende_fazla/feature/app_main/model/add_tab_model.dart';
import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTabButton extends StatelessWidget {
  const AddTabButton({
    super.key,
    required this.onPressed,
    required this.model,
  });

  final AddTabModel model;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<AddProductProvider>().productTypeIndex;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: model.index == selectedIndex ? AppColors.purplePrimary : AppColors.greyLight,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: onPressed,
        child: Text(model.text),
      ),
    );
  }
}
