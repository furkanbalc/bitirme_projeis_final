import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class ShowPhotoWidget extends StatelessWidget {
  const ShowPhotoWidget({super.key, this.image, this.size, this.icon, this.iconSize});

  final DecorationImage? image;
  final double? size;
  final IconData? icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? context.getHeight(factor: .2),
      height: size ?? context.getHeight(factor: .2),
      padding: context.paddings.allMedium,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.providers.watchUserInfo.nullCheck ? AppColors.whiteColor : AppColors.greyLight,
        border: Border.all(
          color: context.providers.watchUserInfo.nullCheck ? AppColors.purplePrimary : AppColors.transparentColor,
          width: 2,
        ),
        image: context.providers.watchUserInfo.nullCheck
            ? DecorationImage(
                fit: BoxFit.cover,
                image: context.providers.watchUserInfo.imageGallery != null
                    ? MemoryImage(context.providers.watchUserInfo.imageGallery!)
                    : FileImage(context.providers.watchUserInfo.imageCamera!) as ImageProvider,
              )
            : null,
      ),
      child: Padding(
        padding: context.paddings.allHigh,
        child: context.providers.watchUserInfo.nullCheck
            ? const SizedBox()
            : Icon(
                icon ?? Icons.add_a_photo_rounded,
                size: iconSize ?? 40,
                color: context.providers.watchUserInfo.nullCheck ? AppColors.transparentColor : AppColors.greyLighter,
              ),
      ),
    );
  }
}
