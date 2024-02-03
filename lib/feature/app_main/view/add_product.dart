import 'package:bende_fazla/feature/app_main/widgets/add/add_product_button.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.kObjectInfo)),
      body: Column(
        children: [
          const AddTabs(),
          Expanded(
            child: Padding(
              padding: context.paddings.horizontalMedium,
              child: context.providers.watchAddProduct.formWidget,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: const AddProductButton(),
    );
  }
}
