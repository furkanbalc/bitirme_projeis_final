import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTypes extends StatelessWidget {
  const ProductTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final type = context.watch<AddProductProvider>().productType;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: context.paddings.verticalNormal,
        child: Text(
          '${AppStrings.kAddProductType}: $type',
          style: context.textStyles.titleLarge,
        ),
      ),
    );
  }
}
