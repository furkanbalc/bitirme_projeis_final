import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatefulWidget {
  const AddProductButton({super.key});

  @override
  State<AddProductButton> createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      buttonWidth: context.getWidth(factor: .9),
      onPressed: context.providers.watchAddProduct.control
          ? () {
              context.providers.readAddProduct.saveProduct(context, mounted);
            }
          : null,
      text: AppStrings.kAddProduct,
    );
  }
}
