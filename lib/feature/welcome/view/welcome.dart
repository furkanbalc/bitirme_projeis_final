import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:bende_fazla/product/utility/box_decoration.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:bende_fazla/product/widgets/images/custom_centered_lottie.dart';
import 'package:flutter/material.dart';

part '../widgets/welcome_text_widget.dart';
part '../widgets/welcome_image_widget.dart';
part '../widgets/welcome_text_buttons.dart';
part '../widgets/welcome_buttons_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleLight,
      appBar: AppBar(backgroundColor: AppColors.purpleLight),
      body: Padding(
        padding: context.paddings.horizontalHigh,
        child: const Column(
          children: [
            /// Welcome Image
            Expanded(child: _WelcomeImageWidget()),

            /// Welcome Text & Buttons
            Expanded(child: _WelcomeTextAndButtons()),
          ],
        ),
      ),
    );
  }
}
