part of '../view/on_boarding.dart';

class _OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _OnBoardingAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,

      /// Back Button
      leading: context.providers.watchOnBoard.isFirstPage
          ? null
          : CustomIconButton(
              onPressed: context.providers.readOnBoard.animateToPrevPage,
              icon: AppIcons.kBackIcon,
              iconColor: AppColors.whiteColor,
            ),

      /// Skip Button
      actions: [
        context.providers.watchOnBoard.isLastPage
            ? const SizedBox.shrink()
            : CustomTextButton(
                onPressed: context.providers.readOnBoard.animateToLastPage,
                text: AppStrings.kSkip,
                color: AppColors.whiteColor,
              ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}
