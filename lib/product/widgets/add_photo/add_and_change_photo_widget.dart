import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/helpers/custom_bottom_sheet.dart';
import 'package:bende_fazla/product/widgets/icon/image_picker_icon.dart';
import 'package:flutter/material.dart';

class AddAndChangePhotoWidget extends StatelessWidget {
  const AddAndChangePhotoWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await customBottomSheet(
          context: context,
          title: AppStrings.kProfilPhoto,
          body: Row(
            children: [
              ImagePickerIcon(
                onTap: () => context.providers.readUserInfo.pickImageFromCamera(context: context),
                icon: AppIcons.kCameraIcon,
                text: AppStrings.kCamera,
              ),
              context.sizedBoxWidthMedium,
              ImagePickerIcon(
                onTap: () => context.providers.readUserInfo.pickImageFromGallery(context: context),
                icon: AppIcons.kGalleryIcon,
                text: AppStrings.kGallery,
              ),
              context.sizedBoxWidthMedium,
              context.providers.readUserInfo.nullCheck
                  ? ImagePickerIcon(
                      onTap: () => context.providers.readUserInfo.pickImageRemove(context: context),
                      icon: AppIcons.kRemoveIcon,
                      text: AppStrings.kRemove,
                    )
                  : context.sizedBoxShrink,
            ],
          ),
        );
      },
      child: child,
    );
  }
}
