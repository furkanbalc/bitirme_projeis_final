part of '../view/welcome.dart';

class _WelcomeImageWidget extends StatelessWidget {
  const _WelcomeImageWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CustomCenteredLottie(
        lottie: AppLotties.hello.toLottie,
        width: context.getWidth(factor: 0.9),
      ),
    );
  }
}
