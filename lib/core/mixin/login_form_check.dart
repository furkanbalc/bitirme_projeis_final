import 'package:bende_fazla/feature/auth/view/login.dart';
import 'package:bende_fazla/feature/auth/view_model/login_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/helpers/error_snackbar.dart';
import 'package:flutter/material.dart';

mixin LoginFormMixin on State<LoginFormWidget> {
  void loginFormCheck(BuildContext context, GlobalKey<FormState> key, LoginProvider read) {
    if (key.currentState != null) {
      if (key.currentState!.validate()) {
        read.loginUser(context: context, mounted: mounted);
      } else {
        read.changeAutoValidate();
        ScaffoldMessenger.of(context).showSnackBar(
          showErrorSnackBar(context: context, message: AppStrings.kPleaseInformationCompletely),
        );
      }
    }
  }
}
