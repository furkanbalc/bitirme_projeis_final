import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:bende_fazla/product/widgets/images/custom_image_widget.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.paddings.horizontalHigh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Image
              CustomImageWidget(imageName: AppImages.verify.toImage, width: context.getWidth(factor: .7)),
              context.sizedBoxHeightMedium,

              /// Title & Subtitle
              Text(
                '${context.providers.readForgotPass.email}\n${AppStrings.kForgotPassSuccess}',
                textAlign: TextAlign.center,
                style: context.textStyles.labelLarge.copyWith(
                  color: AppColors.greyPrimary,
                ),
              ),

              context.sizedBoxHeightMedium,

              /// Buttons
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {},
                      text: AppStrings.kLogin,
                    ),
                  ),
                  context.sizedBoxWidthMedium,
                  Expanded(
                    child: CustomOutlinedButton(
                      buttonTitle: AppStrings.kHomePage,
                      onPressed: () {},
                      butonColor: AppColors.purplePrimary,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
