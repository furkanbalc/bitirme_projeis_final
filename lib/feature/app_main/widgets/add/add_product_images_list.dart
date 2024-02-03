import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImagesList extends StatelessWidget {
  const ProductImagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<AddProductProvider>();
    final read = context.read<AddProductProvider>();
    return SizedBox(
      height: context.getWidth(factor: .2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: watch.imageGallery.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddings.onlyRightNormal,
            child: Container(
              width: context.getWidth(factor: .2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: context.borders.circularBorderRadiusMedium,
                image: DecorationImage(
                  image: MemoryImage((watch.imageGallery[index])),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    read.pickImageRemove(context: context, index: index);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
