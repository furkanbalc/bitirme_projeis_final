import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/feature/app_main/view_model/index.dart';
import 'package:bende_fazla/feature/app_main/view_model/product_view_model.dart';
import 'package:bende_fazla/feature/auth/view_model/index.dart';

import 'package:bende_fazla/feature/on_boarding/view_model/on_boarding_provider.dart';
import 'package:bende_fazla/product/service/location_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

extension CustomProviderExtension on BuildContext {
  CustomProviders get providers => CustomProviders(this);
}

class CustomProviders {
  final BuildContext context;
  CustomProviders(this.context);

  /// Location
  LocationService get readLocation => context.read<LocationService>();
  LocationService get watchLocation => context.watch<LocationService>();

  /// On Boarding
  OnBoardingProvider get readOnBoard => context.read<OnBoardingProvider>();
  OnBoardingProvider get watchOnBoard => context.watch<OnBoardingProvider>();

  /// Login
  LoginProvider get readLogin => context.read<LoginProvider>();
  LoginProvider get watchLogin => context.watch<LoginProvider>();

  /// Signup
  SignupProvider get readSignup => context.read<SignupProvider>();
  SignupProvider get watchSignup => context.watch<SignupProvider>();

  /// Forgot Password
  ForgotPasswordProvider get readForgotPass => context.read<ForgotPasswordProvider>();
  ForgotPasswordProvider get watchForgotPass => context.watch<ForgotPasswordProvider>();

  /// User Info
  UserInfoProvider get readUserInfo => context.read<UserInfoProvider>();
  UserInfoProvider get watchUserInfo => context.watch<UserInfoProvider>();

  /// Base
  BaseProvider get readBase => context.read<BaseProvider>();
  BaseProvider get watchBase => context.watch<BaseProvider>();

  /// Home
  HomeProvider get readHome => context.read<HomeProvider>();
  HomeProvider get watchHome => context.watch<HomeProvider>();

  /// Profile
  ProfileProvider get readProfile => context.read<ProfileProvider>();
  ProfileProvider get watchProfile => context.watch<ProfileProvider>();

  /// Add
  AddProductProvider get readAddProduct => context.read<AddProductProvider>();
  AddProductProvider get watchAddProduct => context.watch<AddProductProvider>();

  /// Product
  ProductViewProvider get readProduct => context.read<ProductViewProvider>();
  ProductViewProvider get watchProduct => context.watch<ProductViewProvider>();
}
