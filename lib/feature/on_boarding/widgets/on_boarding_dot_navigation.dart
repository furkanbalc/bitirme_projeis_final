part of '../view/on_boarding.dart';

class _OnBoardingDotNavigation extends StatelessWidget {
  const _OnBoardingDotNavigation();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.getHeight(factor: .33),
      child: SmoothPageIndicator(
        effect: const ExpandingDotsEffect(activeDotColor: AppColors.purplePrimary, dotColor: AppColors.whiteColor, dotHeight: 5),
        controller: context.providers.watchOnBoard.pageController,
        onDotClicked: context.providers.watchOnBoard.dotNavigationClick,
        count: context.providers.readOnBoard.items.length,
      ),
    );
  }
}
