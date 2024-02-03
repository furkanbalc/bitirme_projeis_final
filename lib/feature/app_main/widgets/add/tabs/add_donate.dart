import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AddDonate extends StatelessWidget {
  const AddDonate({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ProductTypes(),
        Column(
          children: [
            const AddFormTitleWidget(title: AppStrings.kAddPhoto),
            Row(
              children: [
                /// Add Photos
                const AddProductImage(),
                context.sizedBoxWidthLow,

                /// Photos List
                const Expanded(child: ProductImagesList()),
              ],
            ),
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
