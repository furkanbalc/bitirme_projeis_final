import 'package:bende_fazla/feature/auth/view/signup.dart';
import 'package:bende_fazla/feature/auth/view_model/signup_provider.dart';
import 'package:bende_fazla/product/constants/app_strings.dart';
import 'package:bende_fazla/product/helpers/error_snackbar.dart';
import 'package:flutter/material.dart';

mixin SignupFormMixin on State<SignupFormWidget> {
  void signupFormCheck(BuildContext context, GlobalKey<FormState> key, SignupProvider read) {
    if (key.currentState != null) {
      if (key.currentState!.validate()) {
        read.sigunUpUser(context: context, mounted: mounted);
      } else {
        read.changeAutoValidate();
        ScaffoldMessenger.of(context).showSnackBar(
          showErrorSnackBar(context: context, message: AppStrings.kPleaseInformationCompletely),
        );
      }
    }
  }
}
