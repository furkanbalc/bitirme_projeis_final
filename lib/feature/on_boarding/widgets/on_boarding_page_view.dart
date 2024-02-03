import 'package:bende_fazla/feature/on_boarding/model/on_boarding_model.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/utility/box_decoration.dart';
import 'package:bende_fazla/product/widgets/images/custom_centered_lottie.dart';
import 'package:flutter/material.dart';

part 'on_boarding_image.dart';
part 'on_boarding_text.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: context.providers.watchOnBoard.onPageChanged,
      controller: context.providers.watchOnBoard.pageController,
      itemCount: context.providers.readOnBoard.items.length,
      itemBuilder: (context, index) {
        var model = context.providers.readOnBoard.items[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: _OnBoardingImage(model: model)),
            Expanded(child: _OnBoardingText(model: model)),
          ],
        );
      },
    );
  }
}
