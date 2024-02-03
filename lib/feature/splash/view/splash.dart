import 'package:bende_fazla/feature/splash/view_model/splash_view_model.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/images/custom_image_widget.dart';
import 'package:bende_fazla/product/widgets/progress/custom_centered_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../widgets/splash_app_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.light),
      backgroundColor: AppColors.purplePrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// App Logo
          const _SplashAppLogo(),

          /// Loading Circular
          isLoading ? context.sizedBoxShrink : const CustomCenteredCircularProgress(),
        ],
      ),
    );
  }
}
