part of 'on_boarding_page_view.dart';

class _OnBoardingText extends StatelessWidget {
  const _OnBoardingText({required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalUltra,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(model.title, style: context.textStyles.headlineSmall.copyWith(color: AppColors.whiteColor)),
          context.sizedBoxHeightMedium,
          Text(
            model.subTitle,
            textAlign: TextAlign.center,
            style: context.textStyles.titleMedium.copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
