import 'package:bende_fazla/feature/app_main/view/add_product.dart';
import 'package:bende_fazla/feature/app_main/view/base.dart';
import 'package:bende_fazla/feature/app_main/view/product/product_view.dart';
import 'package:bende_fazla/feature/app_main/view/profile/profile.dart';
import 'package:bende_fazla/feature/app_main/view/profile/profile_detail.dart';
import 'package:bende_fazla/feature/auth/view/index.dart';
import 'package:bende_fazla/feature/on_boarding/view/on_boarding.dart';
import 'package:bende_fazla/feature/splash/view/splash.dart';
import 'package:bende_fazla/feature/welcome/view/welcome.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = 'splash';
  static const String onBoard = 'onBoard';
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String userInfo = 'userInfo';
  static const String forgotPassMail = 'forgotPassMail';
  static const String success = 'success';
  static const String base = 'base';
  static const String add = 'add';
  static const String profile = 'profile';
  static const String profileDetail = 'profileDetail';
  static const String product = 'product';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoard:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case welcome:
        return MaterialPageRoute(builder: (context) => const WelcomeView());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signup:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case userInfo:
        return MaterialPageRoute(builder: (context) => const UserInfoView());
      case forgotPassMail:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordView());
      case success:
        return MaterialPageRoute(builder: (context) => const SuccessView());
      case base:
        return MaterialPageRoute(builder: (context) => const BaseView());
      case add:
        return MaterialPageRoute(builder: (context) => const AddProductView());
      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case profileDetail:
        return MaterialPageRoute(builder: (context) => const ProfileDetailView());
      case product:
        return MaterialPageRoute(builder: (context) => const ProductView());

      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('Sayfa Yolu Bulunamadı!'))));
    }
  }
}
