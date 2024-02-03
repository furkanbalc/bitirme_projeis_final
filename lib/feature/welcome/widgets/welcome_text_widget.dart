part of '../view/welcome.dart';

class _WelcomeTextWidget extends StatelessWidget {
  const _WelcomeTextWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalLow,
      child: Column(
        children: [
          Text(
            AppStrings.kWelcomeTitle,
            style: context.textStyles.displaySmall.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
          ),
          context.sizedBoxHeightLow,
          Text(
            AppStrings.kWelcomeSubTitle,
            textAlign: TextAlign.center,
            style: context.textStyles.titleMedium.copyWith(color: AppColors.greyLighter),
          ),
        ],
      ),
    );
  }
}
