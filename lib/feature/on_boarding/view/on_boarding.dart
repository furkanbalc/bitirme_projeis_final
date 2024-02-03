import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/on_boarding/widgets/on_boarding_page_view.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';

part '../widgets/on_boarding_fab.dart';
part '../widgets/on_boarding_app_bar.dart';
part '../widgets/on_boarding_dot_navigation.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.purpleLight,

      /// Appbar
      appBar: _OnBoardingAppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Horizontal Scrollable Pages
          OnBoardingPageView(),

          /// Dot Navigation SmootPageIndicator
          _OnBoardingDotNavigation(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      /// Next Button
      floatingActionButton: _OnBoardingFab(),
    );
  }
}
