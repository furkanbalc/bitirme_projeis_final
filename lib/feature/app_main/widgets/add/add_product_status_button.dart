import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductStatusButton extends StatelessWidget with NavigatorManager {
  const AddProductStatusButton({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    final read = context.read<AddProductProvider>();
    return InkWell(
      onTap: () async {
        read.setProductStatus(status);
        // ignore: use_build_context_synchronously
        navigatePop(context);
      },
      child: Card(
        color: AppColors.purpleLighter,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: context.paddings.verticalMedium,
              child: Text(status, style: context.textStyles.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
