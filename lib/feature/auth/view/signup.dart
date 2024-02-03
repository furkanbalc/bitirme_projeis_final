import 'package:bende_fazla/core/mixin/signup_form_check.dart';
import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/auth/widgets/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:bende_fazla/product/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

part '../widgets/signup/signup_title_widget.dart';
part '../widgets/signup/signup_form_widget.dart';

class SignupView extends StatelessWidget with NavigatorManager {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddings.horizontalHigh,
          child: Column(
            children: [
              const _SignupTitleWidget(),
              context.sizedBoxHeightNormal,

              /// Form
              const SignupFormWidget(),

              /// I Have Already Account
              AuthTextRichButton(
                buttonDesc: AppStrings.kAlreadyHaveAnAccount,
                buttonLabel: AppStrings.kLogin,
                onPressed: () => navigatePushNamed(context, Routes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
