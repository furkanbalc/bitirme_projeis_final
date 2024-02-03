import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AddAbandoned extends StatelessWidget {
  const AddAbandoned({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ProductTypes(),
        const Row(
          children: [
            /// Add Photos
            AddProductImage(),

            /// Photos List
            Expanded(child: ProductImagesList()),
          ],
        ),
        context.sizedBoxHeightLow,

        /// Product Status DropDown
        const AddFormWidget(),
        context.sizedBoxHeightLow,

        /// Product Status Button
        const AddProductStatus(),
        context.sizedBoxHeightLow,

        /// Location Widget
        const AddLocationWidget(),
      ],
    );
  }
}
