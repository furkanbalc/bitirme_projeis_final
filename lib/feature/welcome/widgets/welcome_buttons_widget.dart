part of '../view/welcome.dart';

class _WelcomeButtonsWidget extends StatelessWidget with NavigatorManager {
  const _WelcomeButtonsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          /// Login Button
          child: CustomOutlinedButton(
            buttonTitle: AppStrings.kLogin,
            butonColor: AppColors.purplePrimary,
            onPressed: () => navigatePushNamed(context, Routes.login),
          ),
        ),
        context.sizedBoxWidthLow,
        Expanded(
          /// Signup Button
          child: CustomElevatedButton(
            text: AppStrings.kSignup,
            backgroundColor: AppColors.purplePrimary,
            onPressed: () => navigatePushNamed(context, Routes.signup),
          ),
        ),
      ],
    );
  }
}
