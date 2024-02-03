part of '../../view/signup.dart';

class _SignupTitleWidget extends StatelessWidget {
  const _SignupTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            /// App Name
            text: TextSpan(
              text: AppStrings.kAppName,
              style: context.textStyles.headlineSmall.copyWith(
                fontFamily: AppStrings.kSFProFont,
                fontWeight: FontWeight.w500,
                color: AppColors.purplePrimary,
              ),
              children: [
                /// Welcome
                TextSpan(
                  text: AppStrings.kSignupTitle,
                  style: context.textStyles.headlineSmall.copyWith(
                    fontFamily: AppStrings.kSFProFont,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackPrimary,
                  ),
                ),
              ],
            ),
          ),

          /// Signup SubTitle
          Text(
            AppStrings.kSignupSub,
            style: context.textStyles.titleMedium.copyWith(
              fontFamily: AppStrings.kSFProFont,
              color: AppColors.greyPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
