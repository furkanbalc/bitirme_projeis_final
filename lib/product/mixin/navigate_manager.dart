import 'package:bende_fazla/product/constants/navigator_key.dart';
import 'package:flutter/material.dart';

mixin NavigatorManager {
  void navigatePushNamedAndRemoveUntilNonContext(String route) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false);
    }
  }

  void navigatePushNamedAndRemoveUntil(BuildContext context, String route) {
    if (navigatorKey.currentState != null) {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    }
  }

  void navigatePushNamed(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  void navigatePopAndPushNamed(BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }

  void navigatePop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
