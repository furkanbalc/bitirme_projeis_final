import 'package:bende_fazla/feature/auth/widgets/user_info.dart/user_info_form_widget.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

mixin UserInfoFormMixin on State<UserInfoFormWidget> {
  void userInfoFormCheck(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState != null) {
      if (key.currentState!.validate()) {
        context.providers.readUserInfo.saveUserInfoFirestore(context: context, mounted: mounted);
      }
    }
  }
}
