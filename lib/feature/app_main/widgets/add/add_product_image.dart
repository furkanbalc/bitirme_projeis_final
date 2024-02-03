import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductImage extends StatelessWidget {
  const AddProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            context.read<AddProductProvider>().pickImageFromGallery(context: context);
          },
          child: Container(
            width: context.getWidth(factor: .2),
            height: context.getWidth(factor: .2),
            padding: context.paddings.allMedium,
            decoration: BoxDecoration(
              borderRadius: context.borders.circularBorderRadiusMedium,
              shape: BoxShape.rectangle,
              color: AppColors.greyLight,
            ),
            child: Padding(
              padding: context.paddings.allHigh,
              child: const Icon(
                Icons.add_a_photo_rounded,
                size: 24,
                color: AppColors.greyLighter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
