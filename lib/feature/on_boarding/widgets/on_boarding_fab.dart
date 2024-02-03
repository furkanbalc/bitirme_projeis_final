part of '../view/on_boarding.dart';

class _OnBoardingFab extends StatelessWidget with NavigatorManager {
  const _OnBoardingFab();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: context.providers.watchOnBoard.isLastPage ? AppStrings.kGetStarted : AppStrings.kNext,
      buttonWidth: context.getWidth(factor: .9),
      onPressed: context.providers.watchOnBoard.isLastPage
          ? () {
              context.providers.readOnBoard.changeOnboardStatus();
              navigatePushNamedAndRemoveUntil(context, Routes.welcome);
            }
          : context.providers.readOnBoard.animateToNextPage,
    );
  }
}
