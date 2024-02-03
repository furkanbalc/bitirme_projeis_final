import 'package:bende_fazla/core/mixin/forgot_pass_form_check.dart';
import 'package:bende_fazla/feature/auth/widgets/index.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:bende_fazla/product/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

part '../widgets/forgot_password/forgot_pass_form_widget.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(),
      body: Padding(
        padding: context.paddings.horizontalHigh,
        child: Column(
          children: [
            /// Headings
            const AuthTitleWidget(title: AppStrings.kForgotPass, subTitle: AppStrings.kResetPassEmailDesc),
            context.sizedBoxHeightNormal,

            /// Text Field
            const ForgotPassFormWidget(),
          ],
        ),
      ),
    );
  }
}
