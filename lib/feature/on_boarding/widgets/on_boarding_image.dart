part of 'on_boarding_page_view.dart';

class _OnBoardingImage extends StatelessWidget {
  const _OnBoardingImage({required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalHigh + context.paddings.onlyBottomUltra,
      child: Container(
        decoration: AppBoxDecoration.onboardDecoration,
        child: CustomCenteredLottie(
          lottie: model.img,
          height: context.getWidth(factor: .7),
        ),
      ),
    );
  }
}
