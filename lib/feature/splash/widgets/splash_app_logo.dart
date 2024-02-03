part of '../view/splash.dart';

class _SplashAppLogo extends StatelessWidget {
  const _SplashAppLogo();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomImageWidget(
        imageName: AppImages.logo.toImage,
        width: context.getWidth(factor: .5),
      ),
    );
  }
}
