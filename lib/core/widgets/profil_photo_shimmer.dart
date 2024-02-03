import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilPhotoShimmer extends StatelessWidget {
  const ProfilPhotoShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        width: context.getHeight(factor: .2),
        height: context.getHeight(factor: .2),
        padding: context.paddings.allMedium,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.greyLight,
          border: Border.all(color: Colors.transparent),
        ),
        child: Padding(
          padding: context.paddings.allHigh,
          child: const Icon(Icons.add_a_photo_rounded, size: 48, color: AppColors.greyLighter),
        ),
      ),
    );
  }
}
