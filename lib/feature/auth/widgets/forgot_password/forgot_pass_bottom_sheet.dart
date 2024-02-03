import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/core/widgets/forgot_pass_card_widget.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:flutter/material.dart';

class ForgotPassBottomSheet extends StatelessWidget with NavigatorManager {
  const ForgotPassBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ForgetPassCardWidget(
          icon: AppIcons.kDirectIcon,
          onTap: () => navigatePopAndPushNamed(context, Routes.forgotPassMail),
          title: AppStrings.kFormEmail,
          subTitle: AppStrings.kResetEmailCardDesc,
        ),
        context.sizedBoxHeightLow,
      ],
    );
  }
}
