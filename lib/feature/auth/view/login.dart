import 'package:bende_fazla/core/mixin/login_form_check.dart';
import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/auth/widgets/forgot_password/forgot_pass_bottom_sheet.dart';
import 'package:bende_fazla/feature/auth/widgets/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/helpers/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:bende_fazla/product/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

part '../widgets/login/login_form_widget.dart';
part '../widgets/login/login_forgot_pass_button.dart';

class LoginView extends StatelessWidget with NavigatorManager {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddings.horizontalHigh,
          child: Column(
            children: [
              /// Login Header
              const AuthTitleWidget(title: AppStrings.kLoginTitle, subTitle: AppStrings.kLoginSub),
              context.sizedBoxHeightNormal,

              /// Form
              const LoginFormWidget(),

              /// Dont Have Account
              AuthTextRichButton(
                buttonDesc: AppStrings.kDontHaveAnAccount,
                buttonLabel: AppStrings.kSignup,
                onPressed: () => navigatePushNamed(context, Routes.signup),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
