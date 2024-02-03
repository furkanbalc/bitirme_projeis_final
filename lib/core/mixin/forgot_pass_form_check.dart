import 'package:bende_fazla/feature/auth/view/forgot_password.dart';
import 'package:bende_fazla/feature/auth/view_model/forgot_password_provider.dart';
import 'package:flutter/material.dart';

mixin ForgotPassFormMixin on State<ForgotPassFormWidget> {
  void forgotPassFormCheck(BuildContext context, GlobalKey<FormState> key, ForgotPasswordProvider read) {
    if (key.currentState != null) {
      if (key.currentState!.validate()) {
        read.resetPasswordMail(context: context, mounted: mounted);
      }
    }
  }
}
