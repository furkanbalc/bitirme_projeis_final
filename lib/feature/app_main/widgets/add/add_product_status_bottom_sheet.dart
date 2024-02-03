import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/enums/product_status.dart';
import 'package:bende_fazla/product/mixin/navigate_manager.dart';
import 'package:flutter/material.dart';

class AddProductStatusBottomSheet extends StatelessWidget with NavigatorManager {
  const AddProductStatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        AddProductStatusButton(status: ProductStatus.likeNew.value),
        AddProductStatusButton(status: ProductStatus.usable.value),
        AddProductStatusButton(status: ProductStatus.requiresRepair.value),
      ],
    );
  }
}
